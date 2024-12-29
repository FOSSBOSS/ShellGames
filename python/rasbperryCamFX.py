#!/usr/bin/env python3
from picamera import PiCamera, Color
from time import Sleep 
import os
# Tryna install picamera on a linux desktop instead of a PI
#pip install --no-binary :all: picamera
# nah still busted dang

N = 180
camera = PiCamera()
camera,rotation = N
a=["none","negative","solarized","sketch","emboss","oilpaint","hatch","pastel","watercolor","film",
   "washedout","colorswap","colorpoint","cartoon"]

camera.start_preview()
while 1:
	#camera.annotation
	camera.annotate_forground = Color('red')
	for i in range(len(a)):
		camera.image_effect = a[i]
		camera.annotate_text = "Hackers Gonna Hack"
		sleep(2)
		if i == len(a)-1:
			i = 0
			
#camera.stopListening()
camera.stop_preview()
