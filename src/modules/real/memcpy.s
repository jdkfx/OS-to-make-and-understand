memcpy:
        push    bp
        mov     bp, sp

        push    cx
        push    si
        push    di

        cld
        mov     di, [bp + 4]
        mov     si, [bp + 6]
        mov     cx, [bp + 8]

        rep movsb

        pop     di
        pop     si
        pop     cx

        mov     sp, bp
        pop     bp
        
        ret