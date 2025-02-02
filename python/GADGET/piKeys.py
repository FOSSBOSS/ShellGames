#!/usr/bin/env python3
from pynput.keyboard import Controller
import time
#pip install pynput # as needed
# Create a controller object
keyboard = Controller()

# Send a sequence of keystrokes
keyboard.press('a')
time.sleep(0.2)  # Wait for a brief moment
keyboard.release('a')

keyboard.press('b')
time.sleep(0.2)
keyboard.release('b')

# Sending a combination (e.g., Ctrl + Alt + Del)
keyboard.press('ctrl')
keyboard.press('alt')
keyboard.press('delete')
keyboard.release('delete')
keyboard.release('alt')
keyboard.release('ctrl')

'''
The purpose of this script is to run the pi as virtual keyboard.
This code may well get integrated to the shell script Im writing.
But its late, and I want to do something else.
'''
