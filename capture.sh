#!/usr/bin/env bash
set -euo pipefail
# if wireshark needs to run as root, this script may need to run with sudo. Adjust accordingly.
# The purpose of this script is to log a connection for a long time, then merge later
# Intent: long captures, where you could run into memory issues, if you kept ws running for a long time.

merge_function(){
	echo "Merging output"
	# --- Merge output files ( CTRL+C pressed ) ---
    # sudo chown $USER:$USER -R $OUTDIR
      cd $OUTDIR
      mergecap -w ../output.pcapng *.pcapng
      echo "Merge Complete: See output.pcpng"
      exit 1 
	}

# Trap the SIGINT signal (Ctrl+C) and call cleanup_function
trap merge_function SIGINT

# --- CONFIG ---
#IFACE="enp12s0f1"           # network interface to capture
IFACE="enp3s0"               # network interface to capture
BASENAME="capture"           # base filename for output
SEGMENT_SECONDS=3600         # rotate every hour
MAX_FILES=9999               # keep up to 9999 files (no overwrite in 6 days)
CAPTURE_FILTER=""            # e.g. "tcp port 2537" or leave empty

# --- Resolve script dir and output path ---
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTDIR="$SCRIPT_DIR/cap"
mkdir -p "$OUTDIR"

# --- Build dumpcap command ---
CMD=(dumpcap -i "$IFACE" \
             -b duration:"$SEGMENT_SECONDS" \
             -b files:"$MAX_FILES" \
             -w "${OUTDIR}/${BASENAME}.pcapng")

if [[ -n "$CAPTURE_FILTER" ]]; then
  CMD+=(-f "$CAPTURE_FILTER")
fi

echo "Continuous capture starting on $IFACE"
echo "Files rotate every $SEGMENT_SECONDS seconds (~$((SEGMENT_SECONDS/60)) minutes)"
echo "Output directory: $OUTDIR"
echo "Will keep up to $MAX_FILES files before overwriting old ones."
echo "Running as user: $(whoami)"

# --- Run capture (no sudo needed) ---
"${CMD[@]}"




