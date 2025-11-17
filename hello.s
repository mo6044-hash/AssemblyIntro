//can i vote?
    .section .data
age: .word 21
canVote: .word 0
    .section .text
    .global main
main:
    adrp x0, age
    add x0, x0, :lo12:age
    ldr w1, [x0] //age

    adrp x4, canVote
    add x4, x4, :lo12:canVote
    ldr w2, [x4] //canVote

    cmp w1, #18
    bge legalAge
    mov w3, 0
    str w3, [x4]
    b end
legalAge: 
    mov w3, 1
    str w3, [x4]
end:
    mov w0, 0
    ret
