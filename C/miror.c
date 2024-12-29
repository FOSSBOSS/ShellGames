#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/*
 * $ ./mirror "able i was ere i saw elba"
     able was i ere saw i elba
 
 Looks like its working to me
 * */
void print_mirrored(const char *text, int offset) {
    int len = strlen(text);

    // Print the original text
    // printf("%s", text);

    // Print the offset spaces
    for (int i = 0; i < offset; i++) {
        printf(" ");
    }

    // Print the mirrored text
    for (int i = len - 1; i >= 0; i--) {
        printf("%c", text[i]);
    }

    printf("\n");
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <text> [-n offset]\n", argv[0]);
        return 1;
    }

    int offset = 0; // Default offset

    // Check if -n is provided
    for (int i = 2; i < argc; i++) {
        if (strcmp(argv[i], "-n") == 0 && i + 1 < argc) {
            offset = atoi(argv[i + 1]);
            break;
        }
    }

    print_mirrored(argv[1], offset);

    return 0;
}
