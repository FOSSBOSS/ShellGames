#!/usr/bin/env python3
import RPi.GPIO as GPIO
import time

# Set GPIO mode (BCM = GPIO numbers, BOARD = Pin numbers)
GPIO.setmode(GPIO.BCM)

# Define the pin you want to read
nss = 14 
irq = 15
ch0 = 1
ch1 = 12
ch2 = 16
ch3 = 20
ch4 = 21

# Set up the pin as an input with a pull-down resistor
GPIO.setup(nss, GPIO.OUT)  # set low to select
GPIO.output(nss, GPIO.LOW)
GPIO.setup(irq, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(ch0, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(ch1, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(ch2, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(ch3, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(ch4, GPIO.IN, pull_up_down=GPIO.PUD_DOWN) #respective chanels

try:
    while True:
        state = GPIO.input(irq)  # Read the pin state (1 or 0)
        print(f"GPIO {irq} State: {state}")
        time.sleep(0.5)  # Small delay to avoid excessive printing

except KeyboardInterrupt:
    print("\nExiting...")
    GPIO.cleanup()  # Reset GPIO settings before exit
