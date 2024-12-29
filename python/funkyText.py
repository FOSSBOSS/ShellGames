#!/usr/bin/env python3
import pygame
import random
import sys
'''
Ok its a lil funky, x axis is ok, y-axis needs work, or maybe do a polar trig function for moving text around.
'''
pygame.init()
SCREEN_WIDTH, SCREEN_HEIGHT = 600,800
screen = pygame.display.set_mode((SCREEN_WIDTH,SCREEN_HEIGHT))
pygame.display.set_caption("Lol code live")
BLACK = (0,0,0)
GREEN = (0,255,0)
RED = (255,0,0)
SIZE = 16
font = pygame.font.Font(pygame.font.match_font('monospace'),SIZE)
sample_text = [
"HACKING SYSTEM",
"..............",
"ACCESS GRANTED",
"I AM GROOT",
"IP: 192.168.1.200",
"SENDING NOODS",
"BYTES SENT: 1024",
"EXTRACTING DATAZ",
]
lines = [random.choice(sample_text) for _ in range(50)]
def draw_scrolling_text():
	y_offset = SCREEN_HEIGHT
	for line in lines:
		text_surface = font.render(line, True, RED)
		screen.blit(text_surface,(random.randint(0,SCREEN_WIDTH -200), y_offset))
		y_offset -=200
		
def generate_glitch_effect():
	for _ in range(10):
		pygame.draw.rect(screen,RED,(
		    random.randint(0,SCREEN_WIDTH),
		    random.randint(0,SCREEN_HEIGHT),
		    random.randint(5,20),
		    random.randint(5,20)
		    ))
		    
def main():
	clock = pygame.time.Clock()
	while True:
		for event in pygame.event.get():
			if event.type == pygame.QUIT:
				pygame.quit()
				sys.exit()
		screen.fill(BLACK)
		draw_scrolling_text()
		if random.random()<0.2:
			generate_glitch_effect()
		pygame.display.flip()
		clock.tick(8)
		lines.append(random.choice(sample_text))
		lines.pop(0)
		
		
if __name__ == "__main__":
	main()
		
		
		
		
		
		
		
		
		
		
