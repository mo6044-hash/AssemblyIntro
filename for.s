    .section .data
n: .word 5
    .section .bss
sum: .skip 4
    .section .text
    .global main
main:
    adrp x0, n
    add x0, x0, :lo12:n
    ldr w1, [x0]

    adrp x7, sum
    add x7, x7, :lo12:sum
    ldr w2, [x7]
    mov w2, #0

compare:
    cmp w1, wzr
    bne increment
    str w2, [x7]
    b end
increment:
    add w2, w2, w1
    sub w1, w1, #1
    b compare 
end:
    mov w0, 0
    ret
