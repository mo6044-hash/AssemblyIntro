// long sumFirstThree(long *arr);
    .section .data
msg: .asciz "Value = %ld\n"    
arr: .quad 1, 2, 3, 4, 5, 6
    .section .text
    .global main
main:
    adrp x0, arr
    add x0, x0, :lo12:arr

    bl sumFirstThree

    mov x1, x0
    adrp x0, msg
    add x0, x0, :lo12:msg
    bl printf

    mov w0, 0
    ret



sumFirstThree:
    sub sp, sp, 16
    str x30, [sp]

    //index
    mov x19, 0

    //sum
    mov x21, 0

traverse:
    cmp x19, 3 
    blt addElement
    b end

addElement:
    ldr x20, [x0, x19, lsl 3] //arr[i]
    add x21, x21, x20 // sum += arr[i]
    add x19, x19, 1 //i++
    b traverse

end:
    mov x0, x21

    ldr x30, [sp]
    add sp, sp, 16
    ret
