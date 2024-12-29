#include <stdio.h>
#include <sys/io.h>
#include <unistd.h>
#include <sys/types.h>
/*
Use Case:
This type of program is often used in low-level systems programming, 
particularly for cases where direct hardware access or execution of privileged instructions is required.

However, this code can be dangerous:

    Setting the I/O privilege level to 3 allows the program (and any code it executes) full access to hardware I/O ports. 
    This is generally restricted to kernel mode for security reasons.
    Combined with the ability to execute another program, it can lead to serious security risks
*/
int main(int argc, char * argv[], char * env[]){
	if(argc<2){
		printf("Usage is %s program [arguments]\n",argv[0]);
		return -1;
		}
		
	if(iopl(3)!=0) {
		perror("iopl");
		return -2;
		}
		
	setuid(getuid());

	if(argc >1) {
		execve(argv[1],&argv[1],env);
		}
return 0;		
}
