@echo off
if "%1"=="" goto fileMissing
nasm -f bin %1.asm -o %1.com
goto end
:fileMissing
echo What do you want to Make?
:end
