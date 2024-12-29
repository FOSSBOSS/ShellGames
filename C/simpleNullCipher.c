#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
/*
 * A Simple null ciphr generator
 * Usage: null <input file>
 * output words where first letters assemble to spell the enciphred words.
 *
 * example: 
 * text input: hello world
 * 
 * Output:
 * haired erotic leering live occult 
 * willful occupy reduce love deviation
 * */
 
//Random index: rand()%max + 1 -Min) + min
int r() {
   // srand(time(NULL));
    return (rand() % (4 - 0 + 1)) + 0;
}
//Simple dictionary: 5 words starting with a letter. 5*Char
char simpDict[][130] = {
	"ardent","arcane","an","archaic","archived",
    "bravo","brave","break","because","be",
    "cats","could","clouds","can","cap",
    "dank","deviation","day","drab","drone",
    "esoteric","erotic","error","exit","excited",
    "foxtrot","fornicate","found","feet","feel",
    "games","gains","great","greed","green",
    "hello","here","honor","home","hope",
    "it","incinerate","is","if","incantation",
    "jump","jam","jive","jeer","jest",
    "kill","knife","know","king","knots",
    "love","live","life","leering","lecherously",
    "more","many","make","may","masticate",
    "no","nope","nothing","not","near",
    "occult","occupy","on","odd","oops",
    "pride","pain","peers","perplex","pipe",
    "question","quest","quintessentially","quintuple","quine",
    "risk","ran","rampant","reduce","reuse",
    "stop","sting","stare","should","steal",
    "times","to","tedious","ten","the",
    "umbrella","up","under","uncover","ubiquitous",
    "van","veer","vaccinate","variable","vacuum",
    "we","would","wish","willful","woes",
    "xylem","xii","xylem","xerxes","xystus",
    "year","yes","yank","yarn","you",
    "zoom","zeus","zest","zeta","zygote"
};

//assuming all lower for now, 
void getNC(char c, int count){
	int  i= r();   //random index 0-4
	int  l=c-96;   //l is the base character index
	int wps=5;  //words per set
	int  f = ((l* wps)-wps)+i;  //f is the final index of the dictionary word
	if(l<0){
		printf("\n");
		return;
	}else{
	printf("%s ", simpDict[f]);
	if(count==9 || c <=0){
		printf("\n");
		count =0;
		}
	}
}

int main(int argc, char ** argv){
 srand(time(NULL));
	if(argc !=2){
		printf("Usage: %s <inputfile.txt>\n", argv[0]);
		}
	FILE *file1=fopen(argv[1], "r"); //file to decode
	
	int count = 0; 
	
	if(file1==NULL ){
		printf("Input Files ( %s ) Not Found\n", argv[1]);
		return 0;
		}
		
	char c;
	while(c!=EOF){
		c =tolower(fgetc(file1));
		if(c == EOF){
			break;
			}
		getNC(c, count);	
		count ++;
		}	
		printf("\n");
	return 0;
	}
