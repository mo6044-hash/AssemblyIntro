    .section .data
offset: .word 24, 56, 88    
    .section .bss
Packet: .skip 32 * 3
index: .skip 4
totalChecksum: .skip 8
iOffset: .skip 8
    .section .text
    .global main
main:
    adrp x0, Packet
    add x0, x0, :lo12:Packet

    adrp x2, index
    add x2, x2, :lo12:index
    ldr  w5, [x2]

    ldr x1, [x0, 0]
    mov w3, #'A'
    str w3, [x0, 0]   

    ldr x1, [x0, 4]
    mov w3, #10
    str w3, [x0, 4]

    ldr x1, [x0, 8]
    movz x3, #0xE100
    movk x3, #0x05F5, lsl #16
    str x3, [x0, 8]

    ldr x1, [x0, 16]
    mov w3, #7
    str w3, [x0, 16]

    ldr x1, [x0, 18]
    mov w3, #0xF
    str w3, [x0, 18]

    ldr x1, [x0, 20]
    mov w3, #0x500
    str w3, [x0, 20]

    ldr x1, [x0, 24]
    movz x3, #0x0215
    movk x3, #0x4996, lsl #16
    str x3, [x0, 24]

    ldr x1, [x0, 32]
    mov w3, #'B'
    str w3, [x0, 32]

    ldr x1, [x0, 36]
    mov w3, #20
    str w3, [x0, 36]

    ldr x1, [x0, 40]
    movz x3, #0x2D00
    movk x3, #0x0131, lsl #16
    str x3, [x0, 40]

    ldr x1, [x0, 48]
    mov w3, #-3
    str w3, [x0, 48]

    ldr x1, [x0, 50]
    mov w3, #0x1 
    str w3, [x0, 50]

    ldr x1, [x0, 52]
    mov w3, #0x600
    str w3, [x0, 52]

    ldr x1, [x0, 56]
    movz x3, #0x68B1
    movk x3, #0x3ADE, lsl #16
    str x3, [x0, 56]

    ldr x1, [x0, 64]
    mov w3, #'C'
    str w3, [x0, 64]

    ldr x1, [x0, 68]
    mov w3, #30
    str w3, [x0, 68]

    ldr x1, [x0, 72]
    movz x3, #0xC380
    movk x3, #0x01C9, lsl #16
    str x3, [x0, 72]

    ldr x1, [x0, 80]
    mov w3, 0
    str w3, [x0, 80]

    ldr x1, [x0, 82]
    mov w3, #0x7F
    str w3, [x0, 82]

    ldr x1, [x0, 84]
    mov w3, #0x700
    str w3, [x0, 84]

    ldr x1, [x0, 88]
    movz x3, #0x4BE
    movk x3, #0x034C, lsl #16
    str x3, [x0, 88]

    adrp x1, totalChecksum
    add x1, x1, :lo12:totalChecksum
    ldr x4, [x1]

    adrp x7, offset
    add x7, x7, :lo12:offset

    adrp x9, iOffset
    add x9, x9, :lo12:iOffset
    ldr x10, [x9]

comp:
    cmp w5, 3
    blt sum
    str x4, [x1]
    b end

sum:
    ldr w8, [x7, x10, lsl 2]
    uxtw x8, w8
    add x10, x10, 1 
    ldr x6, [x0, x8]   
    add x4, x4, x6
    add w5, w5, 1
    b comp 
end:
    mov w0, 0
    ret


    
