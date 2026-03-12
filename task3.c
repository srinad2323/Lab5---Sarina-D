#include <stdio.h>

extern int search(void);
int main(){
    int result = search();
    printf("Maximum: %d\n", result);
    return 0;
}