#include <sys/ioctl.h>
#include <unistd.h>
#include <linux/kd.h>
/*
 The bad old days, when this ran, and you didnt have to do silly stuff to make it work. well, here we go:
 lsmod | grep pcspkr
 check the pc-speaker for operability
 its not running eh? coz ur pc is nice and modern....
 sudo modprobe pcspkr
 whats that? it still dont run? do you have a pc speaker even?
 wtf is computing these days anyway? 
 */


int main(void){
    int freq[] = { /* C   D    E    F    G    A    B    C */
                    523, 587, 659, 698, 784, 880, 988, 1046 };
    int i;

    for (i=0; i<8; i++){
            ioctl(STDOUT_FILENO, KIOCSOUND, 1193180/freq[i]);
            usleep(500000);
    }
    ioctl(STDOUT_FILENO, KIOCSOUND, 0); /*Stop silly sound*/
    return 0;

}
