#include <stdio.h>
 
/*
tested on BackTrack 5 R3
First ShellCode , Function : Just Write my name -_- . But i'm noob in C & Asm and i'debuting
*/
 
int main()
{
    char shellcode[] = "\x31\xc0\x31\xdb\x31\xd2\x31\xc9\xb0\x04\xb3\x01\x6a\x0a\x68\x61\x72\x69\x6d\x6a\x6b\x89\xe1\xb2\x09\xcd\x80\xb0\x01\x31\xdb\xcd\x80";  
 
 
    printf("[+]size of ShellC0de : %d\n\n", sizeof(shellcode)-1 );
    (*(void(*)()) shellcode)();
     
    return 0;
}
