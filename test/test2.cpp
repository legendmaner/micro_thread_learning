#include <stdio.h>


extern int save_context(jumpbuf jbuf);
extern void restore_context(jumpbuf jbuf, int ret);
extern void replace_esp(jumpbuf buf, void* rbp);


void func()
{
    printf("come to func.\n");
    restore_context(buf, 1);
}

int main()
{
    jumpbuf buf;

    if (save_context( buf) == 0 )
    {
        printf("first in\n");
        func();
    }
    else
    {
        printf("second in\n");
    }

    printf("ret c=%d\n",c);

}
