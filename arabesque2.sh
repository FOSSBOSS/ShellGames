#!/bin/bash
count=5
for i in `seq 0 3`; do # Lines
for row in {1..11}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
       1)  line+='\   \  \   \   /   /\   \   /   /   /   /' ;;
       2)  line+=' \   \  \___\ /___/  \___\ /___/   /   / ' ;;
       3)  line+='  >   <   ____              ____   >   < ' ;;
       4)  line+='  /   /  /   /              \   \  \   \ ' ;;
       5)  line+=' /___/  /   /                \   \  \___\' ;;
       6)  line+='____   >  <                   >  <   ____' ;;
       7)  line+='\   \  \   \                 /   /  /   /' ;;
       8)  line+=' \   \  \___\               /___/  /   / ' ;;
       9)  line+='  >  <   ____ ____    ____ ____    >   < ' ;;
      10)  line+=' /   /  /   / \   \  /   / \   \   \   \ ' ;;
      11)  line+='/___/  /   /   \   \/   /   \   \   \___\' ;;
    esac
  done
  echo "$line"
  
done
done
exit 1

for i in `seq 0 0`; do # Lines
for row in {1..7}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
       
       1)  line+='____     ____ ' ;;
       2)  line+='\   \   /   / ' ;;
       3)  line+=' \   \ /   /  ' ;;
       4)  line+='  >  <X>  <   ' ;;
       5)  line+=' /   / \   \  ' ;;
       6)  line+='/___/   \___\ ' ;;
    esac
  done
  echo "$line"
done
done







for i in `seq 0 0`; do
for row in {1..7}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
       
       1)  line+='____     ____ ' ;;
       2)  line+='\   \   /   / ' ;;
       3)  line+=' \   \ /   / |' ;;
       4)  line+='  >  <X>  <  O' ;;
       5)  line+=' /   / \   \ |' ;;
       6)  line+='/___/   \___\ ' ;;
    esac
  done
  echo "$line"
done
done





#
for i in `seq 0 1`; do
for row in {1..7}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
       
       1)  line+='_______' ;;
       2)  line+='| /|\  ' ;;
       3)  line+='|//|\\ ' ;;
       4)  line+='|/\|/X\' ;;
       5)  line+='|\X|/\/' ;;
       6)  line+='|\\|// ' ;;
       7)  line+='| \|/  ' ;;
    esac
  done
  echo "$line"
done
done







    |\    /\    /
    | \  /  \  / 
    |  \/    \/  
    |============
    
    |============
    |  /\    /\  
    | /  \  /  \ 
    |/    \/    \


 ____
 \   \
  \   \ 
   >  <
  /   /
 /___/

 ____
 \   \
  \   \ 
   >  <   ____
  /   /  /   /
 /___/  /   /
        >  <
        \   \
         \___\

       ____     ____ 
       \   \   /   / 
        \   \ /   / 
         >  <X>  <  
        /   / \   \ 
       /___/   \___\

       ____     ____ 
       \   \   /   / 
        \   \ /   / 
         >  <X>  <  
        /   / \   \ 
       /___/   \___\

          ____
         /   /
        /   /
 ____   >   <
 \   \  \   \
  \   \  \___\ 
   >  <   ____
  /   /  /   /
 /___/  /   /
        >  <
        \   \
         \___\


   ____
  /   /
 /   /
 >  <
 \   \
  \___\

   ____ ____
  /   / \   \
 /   /   \   \
 >  <     >  <
 \   \   /   /
  \___\ /___/

   ____ ____
  /   / \   \
 /   /   \   \
 >  <     >  <
 \   \   /   /
  \___\ /___/


____
\   \   \   \   /   /
 \   \   \___\ /___/  
  >   <   ____
  /   /  /   /  
 /___/  /   /   
 ____   >  <  
 \   \  \   \ 
  \   \  \___\ 
   >  <   ____ ____
  /   /  /   / \   \
 /___/  /   /   \   \


____                                  ____ 
\   \   \   \   /   / \   \   /   /  /   /
 \   \   \___\ /___/   \___\ /___/  /   /
  >   <   ____               ____   >  <
  /   /  /   /               \   \  \   \
 /___/  /   /                 \   \  \___\
 ____   >  <                   >  <   ____
 \   \  \   \                 /   /  /   /
  \   \  \___\               /___/  /   /
   >  <   ____ ____     ____ ____   >  <  
  /   /  /   / \   \   /   / \   \  \   \
 /___/  /   /   \   \ /   /   \   \  \___\








for i in `seq 0 5`; do
for row in {1..6}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
       1)  line+=' /\  ' ;;
       2)  line+='//\\ ' ;;
       3)  line+='/\/X\' ;;
       4)  line+='\X/\/' ;;
       5)  line+='\\// ' ;;
       6)  line+=' \/  ' ;;
    esac
  done
  echo "$line"
done
done

# In however many lines you have populat the case statment
# the output will be N strings of case object
for i in `seq 0 1`; do
for row in {1..5}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
       1)  line+=' \/\  /\/ ' ;;
       2)  line+=' /_|\/|_\ ' ;;
       3)  line+='X >    < X' ;;
       4)  line+=' \ |/\| / ' ;;
       5)  line+=' /\/  \/\ ' ;;
    esac
  done
  echo "$line"
done
done

 








  




for row in {1..12}; do
  line=""
  for ((i=1; i<=count; i++)); do
    case $row in
       1)  line+='____                                  ____' ;;
       2)  line+='\   \   \   \   /   / \   \   /   /  /   /' ;;
       3)  line+=' \   \   \___\ /___/   \___\ /___/  /   / ' ;;
       4)  line+='  >   <   ____               ____   >  <  ' ;;
       5)  line+='  /   /  /   /               \   \  \   \ ' ;;
       6)  line+=' /___/  /   /                 \   \  \___\' ;;
       7)  line+=' ____   >  <                   >  <   ____' ;;
       8)  line+=' \   \  \   \                 /   /  /   /' ;;
       9)  line+='  \   \  \___\               /___/  /   / ' ;;
      10)  line+='   >  <   ____ ____     ____ ____   >  <  ' ;;
      11)  line+='  /   /  /   / \   \   /   / \   \  \   \ ' ;;
      12)  line+=' /___/  /   /   \   \ /   /   \   \  \___\' ;;
    esac
  done
  echo "$line"
done
echo
