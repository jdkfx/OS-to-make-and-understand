memcpy:
        ;-------------------------------
        ;【スタックフレームの構築】
        ;-------------------------------
                                        ; BP+16| バイト数
                                        ; BP+12| コピー元
                                        ; BP+ 8| コピー先
                                        ;------|---------
        push    ebp                     ; BP+ 0| EBP(元の値)
        mov     ebp, esp                ; BP+ 4| EIP(戻り番地)
                                        ;------+---------

        ;-------------------------------
        ;【レジスタの保存】
        ;-------------------------------
        push    ecx
        push    esi
        push    edi

        ;-------------------------------
        ;バイト単位でのコピー
        ;-------------------------------
        cld                             ; DF = 0; // +方向
        mov     edi, [bp + 8]           ; EDI = コピー先;
        mov     esi, [bp +12]           ; EDI = コピー元;
        mov     ecx, [bp +16]           ; EDI = バイト数;

        rep movsb                       ; while (*EDI++ = *ESI++) ;

        ;-------------------------------
        ;【レジスタの復帰】
        ;-------------------------------
        pop     edi
        pop     esi
        pop     ecx

        ;-------------------------------
        ;【スタックフレームの破棄】
        ;-------------------------------
        mov     esp, ebp
        pop     ebp
        
        ret