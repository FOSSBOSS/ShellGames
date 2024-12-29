#!/bin/bash
# Doesnt work. NEEds tha fix
# Define the text to flash
text="Flashing to the Beat"
audio_file="bla .opus"

# Start playing the audio file in the background, suppressing ffplay output
ffplay -nodisp -autoexit "$audio_file" > /dev/null 2>&1 &
audio_pid=$!

# Use ffmpeg to analyze the audio volume over time and print volume levels
ffmpeg -i "$audio_file" -af "astats=metadata=1:reset=1" -f null - 2>&1 | \
grep "max_volume" | \
while read -r line; do
    # Extract the max volume level from the line
    volume=$(echo "$line" | grep -oP 'max_volume: \K[-0-9.]+')
    
    # Define a threshold for flashing text based on volume
    if (( $(echo "$volume > -20" | bc -l) )); then
        # Flash text
        echo -ne "\r$text"
        sleep 0.1
        echo -ne "\r$(printf ' %.0s' $(seq 1 ${#text}))"
        sleep 0.1
    else
        sleep 0.1  # Pause briefly if no beat detected
    fi
    
    # Break loop if audio has stopped playing
    if ! kill -0 "$audio_pid" 2>/dev/null; then
        break
    fi
done

# Wait for the audio to finish
wait $audio_pid
