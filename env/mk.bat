@echo off
if exist kernel.s (
    @nasm boot.s -o boot.bin -l boot.lst
    @nasm kernel.s -o kernel.bin -l kernel.lst
    @copy /B boot.bin+kernel.bin boot.img
) else (
    @nasm boot.s -o boot.img -l boot.lst
)