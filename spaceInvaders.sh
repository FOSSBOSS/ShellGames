#!/bin/bash
# Glitchy AF lol
# Initialize the game
clear
ROWS=$(tput lines)
COLS=$(tput cols)
PLAYER="^"
ENEMY="V"
PLAYER_POS=$((COLS / 2))
ENEMY_POS=$((COLS / 2))
BULLETS=()
SCORE=0

# Function to draw the game screen
draw() {
  clear
  for i in "${BULLETS[@]}"; do
    tput cup "$i" "$PLAYER_POS"
    echo " "
  done
  BULLETS=()
  tput cup "$(($ROWS - 1))" "$PLAYER_POS"
  echo "$PLAYER"
  tput cup 0 "$ENEMY_POS"
  echo "$ENEMY"
}

# Function to move the player
move_player() {
  read -rsn1 -t 0.01 key
  if [ "$key" == "a" ]; then
    ((PLAYER_POS--))
  elif [ "$key" == "d" ]; then
    ((PLAYER_POS++))
  elif [ "$key" == "q" ]; then
    exit 0
  fi
}

# Function to move the enemy
move_enemy() {
  ENEMY_POS=$((ENEMY_POS + RANDOM % 3 - 1))
  if [ "$ENEMY_POS" -lt 0 ]; then
    ENEMY_POS=0
  elif [ "$ENEMY_POS" -ge "$COLS" ]; then
    ENEMY_POS="$((COLS - 1))"
  fi
}

# Function to update the bullets
update_bullets() {
  for i in "${!BULLETS[@]}"; do
    ((BULLETS[$i]--))
    if [ "${BULLETS[$i]}" -le 0 ]; then
      unset 'BULLETS[i]'
      ((SCORE++))
    fi
  done
}

# Main game loop
while true; do
  move_player
  move_enemy
  update_bullets
  draw

  if [ "$ENEMY_POS" -eq "$PLAYER_POS" ]; then
    echo "Game Over! Score: $SCORE"
  #  exit 0
  fi

  sleep 0.1
done

