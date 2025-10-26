#!/bin/bash

# analyzeCapture.sh Analyze a pcapng file for known and unknown devices, & report useful network health statistics.
# Usage: ./analyzeCapture.sh output.pcapng port
# analyze output of capture.sh
# Made for modbus, will mod later to be more flexible

PCAP="$1"
PORT="502" || $2
if [[ -z "$PCAP" || ! -f "$PCAP" ]]; then
    echo "Usage: $0 capture.pcapng"
    exit 1
fi

# Known devices whitelist
# Adjust this list for IPs on your subnet.
KNOWN_IPS=(
  10.10.10.1
  10.10.10.10
  10.10.10.11
  10.10.10.30
  10.10.10.31
  10.10.10.37
  10.10.10.38
  10.10.10.39
  10.10.10.43
  10.10.10.55
  10.10.10.57
  10.10.10.67
  10.10.10.75
  10.10.10.255       # subnet broadcast
  255.255.255.255    # limited broadcast
)

# Build filter expression
FILTER=""
for ip in "${KNOWN_IPS[@]}"; do
    [[ -n "$FILTER" ]] && FILTER+=" or "
    FILTER+="ip.addr==$ip"
done

# Known endpoints report
echo "=== Known Endpoints Report ==="
tshark -r "$PCAP" -q -z endpoints,ip,"$FILTER"
echo

# Unknown endpoints report
echo "=== Unknown Endpoints Report ==="

ALL_STATS=$(tshark -r "$PCAP" -q -z endpoints,ip)

# Extract IP rows (skip headers and separators)
ENDPOINTS=$(echo "$ALL_STATS" | awk 'NR>6 && !/^=/' | awk '{print $1, $2, $3}')

# Build regex for known IPs
KNOWN_REGEX=$(IFS=\|; echo "${KNOWN_IPS[*]}")

# Filter unknowns
UNKNOWN_STATS=$(echo "$ENDPOINTS" | grep -Ev "(${KNOWN_REGEX})")

if [[ -z "$UNKNOWN_STATS" ]]; then
    echo "No unknown endpoints detected."
else
    echo "IP Address        Packets    Bytes"
    echo "-----------------------------------"
    echo "$UNKNOWN_STATS"
fi
echo

# Traffic volumes
echo "=== Traffic Volume Analysis ==="
DURATION=$(tshark -r "$PCAP" -T fields -e frame.time_epoch | \
           awk 'NR==1{start=$1} {end=$1} END{print end-start}')

TOTAL_BYTES=$(tshark -r "$PCAP" -T fields -e frame.len | awk '{s+=$1} END{print s}')
KNOWN_BYTES=$(tshark -r "$PCAP" -Y "$FILTER" -T fields -e frame.len | awk '{s+=$1} END{print s}')
UNKNOWN_BYTES=$((TOTAL_BYTES - KNOWN_BYTES))

if (( $(echo "$DURATION > 0" | bc -l) )); then
    TOTAL_MBPS=$(echo "scale=3; ($TOTAL_BYTES / $DURATION) / 1048576" | bc -l)
    KNOWN_MBPS=$(echo "scale=3; ($KNOWN_BYTES / $DURATION) / 1048576" | bc -l)
    UNKNOWN_MBPS=$(echo "scale=3; ($UNKNOWN_BYTES / $DURATION) / 1048576" | bc -l)
    PCT_UNKNOWN=$(echo "scale=2; ($UNKNOWN_BYTES*100)/$TOTAL_BYTES" | bc -l)
    echo "  Capture duration: ${DURATION}s"
    echo "  Total traffic:    $TOTAL_MBPS MB/s"
    echo "  Known traffic:    $KNOWN_MBPS MB/s"
    echo "  Unknown traffic:  $UNKNOWN_MBPS MB/s ($PCT_UNKNOWN % of total)"
else
    echo "  Error: could not compute capture duration"
fi
echo

# Broadcast / multicast
echo "=== Broadcast / Multicast Traffic ==="
BCOUNT=$(tshark -r "$PCAP" -Y "eth.dst==ff:ff:ff:ff:ff:ff or eth.dst[0] & 1" | wc -l)
if (( $(echo "$DURATION > 0" | bc -l) )); then
    BPS=$(echo "scale=2; $BCOUNT / $DURATION" | bc -l)
    echo "  Total: $BCOUNT packets"
    echo "  Rate:  $BPS packets/sec"
else
    echo "  Error: could not compute capture duration"
fi
echo

# Packet health indicators
echo "=== Packet Health Indicators ==="
echo "TCP retransmissions / duplicate ACKs:"
tshark -r "$PCAP" -Y "tcp.analysis.retransmission or tcp.analysis.duplicate_ack" | wc -l

echo "TCP resets:"
tshark -r "$PCAP" -Y "tcp.flags.reset==1" | wc -l

echo "Zero-window conditions:"
tshark -r "$PCAP" -Y "tcp.analysis.zero_window" | wc -l
echo

# Modbus/TCP health
echo "=== Modbus/TCP Health (port 502) ==="
echo "Retransmissions:"
tshark -r "$PCAP" -Y "tcp.port==502 and (tcp.analysis.retransmission or tcp.analysis.fast_retransmission)" | wc -l

echo "Duplicate ACKs:"
tshark -r "$PCAP" -Y "tcp.port==502 and tcp.analysis.duplicate_ack" | wc -l

echo "Modbus Exceptions:"
tshark -r "$PCAP" -Y "modbus && modbus.exception_code" | wc -l
echo

# Collisions note
echo "=== Collision Information ==="
echo "Note: Collisions cannot be detected from a pcap."
echo "Check switch or NIC stats (e.g., ethtool -S eth0, or switch CLI)."
echo
