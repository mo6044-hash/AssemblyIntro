    .section .data
arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    .section .bss
index: .skip 4
sum: .skip 4
    .section .text
    .global main
main:   
    //base
    adrp x0, arr
    add x0, x0, :lo12:arr

    //index
    adrp x1, index
    add x1, x1, :lo12:index
    ldr w2, [x1]

    //sum
    adrp x1, sum
    add x1, x1, :lo12:sum
    ldr w3, [x1]

comp: 
    cmp w2, #10
    blt traverse
    str w3, [x1]
    b end

traverse:
    ldr w4, [x0, x2, lsl 2]
    lsl w4, w4, 1
    add w3, w3, w4
    str w4, [x0, x2, lsl 2]
    add w2, w2, #1
    b comp
end:
    mov w0, 0
    ret
