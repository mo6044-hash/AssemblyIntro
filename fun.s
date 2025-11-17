/*
int main() {
    long result = compute(10);
}
 */

    .section .text
    .global main
main:
    //result
    sub sp, sp, 16
    mov x19, 0 //result not yet calculated
    str x19, [sp]

    mov x0, #10 //argument

    bl compute
    b here
here:
    add sp, sp, 16
end:
    mov w0, 0
    ret


compute:
    sub sp, sp, 32

    //store return address
    str x30, [sp]

    //store argument in stack
    str x0, [sp, 8]

    //local variable z
    mov x19, 0
    str x19, [sp, 16]

    bl add3

    sub x0, x0, 5
    ldr x30, [sp]
    add sp, sp, 32
    ret

add3:
    //return address
    sub sp, sp, 32
    str x30, [sp]

    //x
    str x0, [sp, 8]

    //y
    mov x19, 0
    str x19, [sp, 16]

    bl mul2    

    //y
    ldr x19, [sp, 16]
    mov x19, x0

    add x0, x0, 3

    ldr x30, [sp]
    add sp, sp, 32
    ret


mul2:
    sub sp, sp, 16

    //return address
    str x30, [sp]

    lsl x0, x0, 1

    ldr x30, [sp]
    add sp, sp, 16

    ret
