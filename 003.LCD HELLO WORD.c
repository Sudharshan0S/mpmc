#include <lpc214x.h>
#include <stdio.h>

const char *msg = "HELLO WORLD\r", *ptr;

int main(void) {
    PINSEL0 = 0x00000005;
    U0LCR = 0x00000083;
    U0DLM = 0x00;
    U0DLL = 0x13;
    U0LCR = 0x00000003;
    ptr = msg;

    while (1) {
        while (*msg != 0x00) {
            while (!(U0LSR & 0x20));
            U0THR = *msg;
            msg++;
        }
        msg = ptr;
    }
}
