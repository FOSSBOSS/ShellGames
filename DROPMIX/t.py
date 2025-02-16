#!/usr/bin/env python3
import spidev, os, sys, subprocess, math, csv
import pandas as pd
import RPi.GPIO as GPIO
from time import sleep

# Setup the SPI connection
spi = spidev.SpiDev()
spi.open(0, 0)  # Bus 0, device 0 (Chip Select 0)
spi.max_speed_hz = 50000  # Set the SPI speed (adjust as needed)

#NSS = Chip Select
nss = 14
irq = 15 # I havent wired this in yet
# Setup GPIO for Chip Select (CS)
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False) 
GPIO.setup(nss, GPIO.OUT)  # set low to select
GPIO.setup(irq, GPIO.OUT)  # might be input


# Cleanup GPIO on exit
def cleanup():
    GPIO.cleanup()
    spi.close()

