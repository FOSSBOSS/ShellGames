import RPi.GPIO as GPIO
import time
import matplotlib.pyplot as plt
from collections import deque

# Set up the GPIO pins
TRIG = 23  # GPIO pin for the TRIG
ECHO = 24  # GPIO pin for the ECHO

GPIO.setmode(GPIO.BCM)
GPIO.setup(TRIG, GPIO.OUT)
GPIO.setup(ECHO, GPIO.IN)

# Function to get distance from HC-SR04
def get_distance():
    # Ensure TRIG is low
    GPIO.output(TRIG, False)
    time.sleep(0.05)

    # Trigger the sensor (send 10us pulse)
    GPIO.output(TRIG, True)
    time.sleep(0.00001)  # 10 microseconds
    GPIO.output(TRIG, False)

    # Wait for ECHO to go high (start of the pulse)
    while GPIO.input(ECHO) == 0:
        pulse_start = time.time()

    # Wait for ECHO to go low (end of the pulse)
    while GPIO.input(ECHO) == 1:
        pulse_end = time.time()

    # Calculate pulse duration
    pulse_duration = pulse_end - pulse_start

    # Speed of sound = 34300 cm/s, distance = (duration / 2) * speed of sound
    distance = pulse_duration * 17150
    distance = round(distance, 2)

    return distance

# Initialize the plot
plt.ion()  # Turn on interactive mode for live updating plot
fig, ax = plt.subplots()

# Set up deque for keeping track of time and distance
time_data = deque(maxlen=600)  # Holds up to 600 data points (10 per second for 60 seconds)
distance_data = deque(maxlen=600)
start_time = time.time()

def update_plot():
    # Clear the plot
    ax.clear()

    # Plot the data
    ax.plot(time_data, distance_data)

    # Set plot labels and title
    ax.set_xlabel('Time (seconds)')
    ax.set_ylabel('Distance (cm)')
    ax.set_title('Distance vs Time')

    # Redraw the plot
    plt.draw()
    plt.pause(0.01)

try:
    while True:
        # Get the distance
        dist = get_distance()

        # Calculate the current time relative to the start
        current_time = time.time() - start_time

        # Append the data
        time_data.append(current_time)
        distance_data.append(dist)

        # Print the distance to the console (optional)
        print(f"Time: {current_time:.2f} s, Distance: {dist} cm")

        # Update the plot
        update_plot()

        # Sleep for a short time to get ~10 readings per second
        time.sleep(0.1)

        # Restart the plot after 60 seconds
        if current_time >= 60:
            time_data.clear()
            distance_data.clear()
            start_time = time.time()  # Reset the start time

except KeyboardInterrupt:
    print("Measurement stopped by User")
    GPIO.cleanup()
