@echo off
chcp 65001
cd %~dp0
cls
del ..\sub
for /f "eol=# tokens=1 delims= " %%i in (.\link.ini) do (
>1.tmp curl %%i
certutil -f -decode 1.tmp 2.tmp
type 2.tmp>>3.tmp
echo.>>3.tmp
)

findstr /c:"://" 3.tmp | findstr /v /b /c:"ht" >4.tmp
set LC_ALL='C'
s -u -i -o 5.tmp 4.tmp
certutil -f -encode 5.tmp 6.tmp
findstr /v /b /c:"----" 6.tmp > ..\sub
del *.tmp
