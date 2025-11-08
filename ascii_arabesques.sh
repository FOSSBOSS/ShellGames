#!/bin/bash

count=10
for i in {1..6}; do
# In however many lines you have populat the case statment
# the output will be N strings of case object
for row in {1..20}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
      1)   line+=' \ /  |  |  |\          /|  |  |  \ / ' ;;
      2)   line+='--X-- |  |  | \        / |  |  | --X--' ;;
      3)   line+='_/_\__|  |  |  \      /  |  |  |__/_\_' ;;
      4)   line+='         |  |   \    /   |  |         ' ;;
      5)   line+='_________|  | |\ \  / /| |  |_________' ;;
      6)   line+='  __________| | \ \/ / | L____________' ;;
      7)   line+='  \     ______j  \  /  |_____        /' ;;
      8)   line+=' \ \    \                    /      / ' ;;
      9)   line+='  \ \    \                  /      / /' ;;
      10)  line+='   \ \    \                /      / / ' ;;
      11)  line+='   / /    /                \      \ \ ' ;;
      12)  line+='  / /    /                  \      \ \' ;;
      13)  line+=' / /    /_____          _____\      \ ' ;;
      14)  line+='  /_________  |  /  \  |  ___________\' ;;
      15)  line+='_________   | | / /\ \ | |   _________' ;;
      16)  line+='         |  | |/ /  \ \| |  |         ' ;;
      17)  line+='______   |  |   /    \   |  |   ______' ;;
      18)  line+=' \ /  |  |  |  /      \  |  |  |  \ / ' ;;
      19)  line+='--X-- |  |  | /        \ |  |  | --X--' ;;
      20)  line+=' / \  |  |  |/          \|  |  |  / \ ' ;;
    esac
  done
  echo "$line"
done

done

for row in {1..20}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
      1)   line+=' \ /  |  |  |\  \    /  /|  |  |  \ / ' ;;
      2)   line+='--X-- |  |  | \  \  /  / |  |  | --X--' ;;
      3)   line+='_/_\__|  |  |  \  \/  /  |  |  |__/_\_' ;;
      4)   line+='         |  |   \    /   |  |         ' ;;
      5)   line+='_________|  | |\ \  / /| |  |_________' ;;
      6)   line+='  __________| | \ \/ / | L____________' ;;
      7)   line+='  \     ______j  \  /  |_____        /' ;;
      8)   line+=' \ \    \                    /      / ' ;;
      9)   line+='  \ \    \                  /      / /' ;;
      10)  line+='   \ \    \                /      / / ' ;;
      11)  line+='   / /    /                \      \ \ ' ;;
      12)  line+='  / /    /                  \      \ \' ;;
      13)  line+=' / /    /_____          _____\      \ ' ;;
      14)  line+='  /_________  |  /  \  |  ___________\' ;;
      15)  line+='_________   | | / /\ \ | |   _________' ;;
      16)  line+='         |  | |/ /  \ \| |  |         ' ;;
      17)  line+='______   |  |   /    \   |  |   ______' ;;
      18)  line+=' \ /  |  |  |  /  /\  \  |  |  |  \ / ' ;;
      19)  line+='--X-- |  |  | /  /  \  \ |  |  | --X--' ;;
      20)  line+=' / \  |  |  |/  /    \  \|  |  |  / \ ' ;;
    esac
  done
  echo "$line"
done


for row in {1..20}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
      1)   line+=' \ /  |  |  |\  \    /  /|  |  |  \ / ' ;;
      2)   line+='--X-- |  |  | \  \  /  / |  |  | --X--' ;;
      3)   line+='_/_\__|  |  |  \  \/  /  |  |  |__/_\_' ;;
      4)   line+='         |  |   \    /   |  |         ' ;;
      5)   line+='_________|  | |\ \  / /| |  |_________' ;;
      6)   line+='  __________| | \ \/ / | L____________' ;;
      7)   line+='  \     ______j  \  /  |_____        /' ;;
      8)   line+=' \ \    \                    /      / ' ;;
      9)   line+='  \ \    \     _\|\/|/_     /      / /' ;;
      10)  line+='   \ \    \    \ \  / /    /      / / ' ;;
      11)  line+='   / /    /    /_/  \_\    \      \ \ ' ;;
      12)  line+='  / /    /      /|/\|\      \      \ \' ;;
      13)  line+=' / /    /_____          _____\      \ ' ;;
      14)  line+='  /_________  |  /  \  |  ___________\' ;;
      15)  line+='_________   | | / /\ \ | |   _________' ;;
      16)  line+='         |  | |/ /  \ \| |  |         ' ;;
      17)  line+='______   |  |   /    \   |  |   ______' ;;
      18)  line+=' \ /  |  |  |  /  /\  \  |  |  |  \ / ' ;;
      19)  line+='--X-- |  |  | /  /  \  \ |  |  | --X--' ;;
      20)  line+=' / \  |  |  |/  /    \  \|  |  |  / \ ' ;;
    esac
  done
  echo "$line"
done


exit 1

for row in {1..20}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
      1)   line+='      |  |  |\           /|  |  |       ' ;;
      2)   line+='      |  |  | \         / |  |  |       ' ;;
      3)   line+='______|  |  |  \       /  |  |  |_______' ;;
      4)   line+='         |  |   \     /   |  |          ' ;;
      5)   line+='_________|  | |\ \   / /| |  |__________' ;;
      6)   line+='  __________| | \ \ / / | L___________  ' ;;
      7)   line+='  \       ____j  \   /  |_____        / ' ;;
      8)   line+=' \ \     \                   /       / /' ;;
      9)   line+='  \ \     \                 /       / / ' ;;
      10)  line+='   \ \     \               /       / /  ' ;;
      11)  line+='   / /     /               \       \ \  ' ;;
      12)  line+='  / /     /                 \       \ \ ' ;;
      13)  line+=' / /     /_____          ____\       \ \' ;;
      14)  line+='  /__________  |  /  \  |  ___________\ ' ;;
      15)  line+='__________   | | / /\ \ | |   __________' ;;
      16)  line+='          |  | |/ /  \ \| |  |          ' ;;
      17)  line+='_____     |  |   /    \   |  |    ______' ;;
      18)  line+='     |    |  |  /      \  |  |   |      ' ;;
      19)  line+='     |    |  | /        \ |  |   |      ' ;;
      20)  line+='     |    |  |/          \|  |   |      ' ;;
    esac
  done
  echo "$line"
done




# In however many lines you have populat the case statment
# the output will be N strings of case object
for row in {1..20}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
      1)   line+='            |\           /|             ' ;;
      2)   line+='            | \         / |             ' ;;
      3)   line+='            |  \       /  |             ' ;;
      4)   line+='            |   \     /   |             ' ;;
      5)   line+='            | |\ \   / /| |             ' ;;
      6)   line+='  __________| | \ \ / / | L___________  ' ;;
      7)   line+='  \       ____j  \   /  |_____        / ' ;;
      8)   line+=' \ \     \                   /       / /' ;;
      9)   line+='  \ \     \                 /       / / ' ;;
      10)  line+='   \ \     \               /       / /  ' ;;
      11)  line+='   / /     /               \       \ \  ' ;;
      12)  line+='  / /     /                 \       \ \ ' ;;
      13)  line+=' / /     /_____          ____\       \ \' ;;
      14)  line+='  /__________  |  /  \  |  ___________\ ' ;;
      15)  line+='             | | / /\ \ | |             ' ;;
      16)  line+='             | |/ /  \ \| |             ' ;;
      17)  line+='             |   /    \   |             ' ;;
      18)  line+='             |  /      \  |             ' ;;
      19)  line+='             | /        \ |             ' ;;
      20)  line+='             |/          \|             ' ;;
    esac
  done
  echo "$line"
done

# In however many lines you have populat the case statment
# the output will be N strings of case object
echo
for row in {1..20}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
      1)   line+='          |\           /|          ' ;;
      2)   line+='          | \         / |          ' ;;
      3)   line+='          |  \       /  |          ' ;;
      4)   line+='          |   \     /   |          ' ;;
      5)   line+='          |    \   /    |          ' ;;
      6)   line+='__________|     \ /     L__________' ;;
      7)   line+='\                                 /' ;;
      8)   line+=' \                               / ' ;;
      9)   line+='  \                             /  ' ;;
      10)  line+='   \                           /   ' ;;
      11)  line+='   /                           \   ' ;;
      12)  line+='  /                             \  ' ;;
      13)  line+=' /                               \ ' ;;
      14)  line+='/__________             __________\' ;;
      15)  line+='           |     /\     |          ' ;;
      16)  line+='           |    /  \    |          ' ;;
      17)  line+='           |   /    \   |          ' ;;
      18)  line+='           |  /      \  |          ' ;;
      19)  line+='           | /        \ |          ' ;;
      20)  line+='           |/          \|          ' ;;
    esac
  done
  echo "$line"
done
echo


echo
for row in {1..9}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
      1)  line+=' \ / ' ;;
      2)  line+='--X--' ;;
      3)  line+=' / \ ' ;;

    esac
  done
  echo "$line"
done
exit 1

# In however many lines you have populat the case statment
# the output will be N strings of case object
echo
for row in {1..20}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
       1)  line+='' ;;
       2)  line+='' ;;
       3)  line+='' ;;
       4)  line+='' ;;
       5)  line+='' ;;
       6)  line+='' ;;
       7)  line+='' ;;
       8)  line+='' ;;
       9)  line+='' ;;
      10)  line+='' ;;
      11)  line+='' ;;
      12)  line+='' ;;
      13)  line+='' ;;
      14)  line+='' ;;
      15)  line+='' ;;
      16)  line+='' ;;
      17)  line+='' ;;
      18)  line+='' ;;
      19)  line+='' ;;
      20)  line+='' ;;
    esac
  done
  echo "$line"
done
echo

