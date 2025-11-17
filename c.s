    .section .data
x: .word 15
y: .word -4
z: .word 12
    .section .bss
result: .skip 4
    .section .text
    .global main
main:
    adrp x0, x
    add x0, x0, :lo12:x
    ldr w1, [x0]  

    adrp x0, y
    add x0, x0, :lo12:y
    ldr w2, [x0]        

    adrp x0, z
    add x0, x0, :lo12:z
    ldr w3, [x0]

    adrp x0, result
    add x0, x0, :lo12:result

    cmp w1, w2
    bgt xGTy
    cmp w2, wzr
    beq yEQzero
    mov w4, #-999
    str w4, [x0]
    b end
yEQzero:
    mov w4, #999
    str w4, [x0]
    b end    
xGTy:
    cmp w3, wzr
    blt zLTzero
    sub w4, w1, w3
    str w4, [x0]
    b end
zLTzero:
    add w4, w1, w3
    str w4, [x0] 
    b end       
end:
    mov w0, 0
    ret
