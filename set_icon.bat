@echo off
chcp 1251 >nul
echo ------------------------
echo ������ resource ������.
set p=.\build\Release\

echo ���������������� *ico ������ . . .
for %%i in (*.ico) do (
    ren "%%i" "icon%%~xi"
)

echo �������� ����� �������� .rc . . .
echo MAIN_ICON ICON "icon.ico" > rs.rc
timeout 1 >nul

windres rs.rc -O coff -o %p%resource.o 

if %errorlevel% neq 0 (
    echo.
    echo ----------------------------
    echo ������ ��� ������ resource.
    echo ----------------------------
    echo.
    pause
    exit /b
)

    timeout 1 >nul
    echo ������ resource ���������.
    echo ------------------------ 
    echo.
    echo ------------------------
    echo ������ my.exe ������.
    g++ %p%main.o %p%resource.o -o %p%my.exe

if %errorlevel% neq 0 (
    echo.
    echo ----------------------------
    echo ������ ��� ������ my.exe.
    echo ----------------------------
    echo.
    pause
    exit /b
)

    timeout 1 >nul
    echo ������ my.exe ���������.
    echo ------------------------ 
    echo.
    echo ����� . . .
    timeout 2 >nul