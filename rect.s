//----------------------------------------------------------------------
// rect.s
// Author: Bob Dondero and William Ughetta
//----------------------------------------------------------------------

        .section .rodata

lengthPromptStr:
        .string "Rectangle length:  "

widthPromptStr:
        .string "Rectangle width:  "

scanfFormatStr:
        .string "%d"

printfFormatStr:
        .string "The rectangle's perimeter is %d.\n"

//----------------------------------------------------------------------

        .section .data

//----------------------------------------------------------------------

        .section .bss

//iLength:
        .skip   4

//iWidth:
        .skip   4

//iPerim:
        .skip   4

//----------------------------------------------------------------------

        .section .text

        //--------------------------------------------------------------
        // Read a rectangles length and width from stdin, and write
        // its perimeter to stdout.  Return 0.
        // int main(void)
        //--------------------------------------------------------------

        // Must be a multiple of 16
        .equ    MAIN_STACK_BYTECOUNT, 32
        .equ iLength, 8
        .equ iWidth, 12
        .equ iPerim, 16

        .global main

main:
        
        // Prolog
        sub     sp, sp, MAIN_STACK_BYTECOUNT
        str     x30, [sp]
        
        // printf("Rectangle length:  ")
        adr     x0, lengthPromptStr
        bl      printf

        // scanf("%d", &iLength)
        adr     x0, scanfFormatStr
        add     x1, sp, iLength
        bl      scanf

        // printf("Rectangle width:  ")
        adr     x0, widthPromptStr
        bl      printf

        // scanf("%d", &iWidth)
        adr     x0, scanfFormatStr
        add     x1, sp, iWidth
        bl      scanf

        // iPerimeter = 2 * (iLength + iWidth)
        
        ldr     w0, [sp, iLength]
        
        ldr     w1, [sp, iWidth] 
        add     w0, w0, w1
        lsl     w0, w0, 1
           // Alternatives to lsl (either of these two):
           //    add w0, w0, w0
           //    mov w1, 2; mul w0, w0, w1
        adr     x1, iPerim
        str     w0, [sp, iPerim]

        // printf("The rectangle's perimeter is %d.\n", iPerim)
        adr     x0, printfFormatStr
        adr     x1, iPerim
        ldr     w1, [sp, iPerim]
        bl      printf
                
        // Epilog and return 0
        mov     w0, 0
        ldr     x30, [sp]
        add     sp, sp, MAIN_STACK_BYTECOUNT
        ret

        .size   main, (. - main)
