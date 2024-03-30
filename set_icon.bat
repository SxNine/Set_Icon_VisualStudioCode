@echo off
chcp 1251 >nul
echo ------------------------
echo Сборка resource начата.
set p=.\build\Release\

echo Переименовывание *ico файлов . . .
for %%i in (*.ico) do (
    ren "%%i" "icon%%~xi"
)

echo Создание файла ресурсов .rc . . .
echo MAIN_ICON ICON "icon.ico" > rs.rc
timeout 1 >nul

windres rs.rc -O coff -o %p%resource.o 

if %errorlevel% neq 0 (
    echo.
    echo ----------------------------
    echo Ошибка при сборке resource.
    echo ----------------------------
    echo.
    pause
    exit /b
)

    timeout 1 >nul
    echo Сборка resource завершена.
    echo ------------------------ 
    echo.
    echo ------------------------
    echo Сборка my.exe начата.
    g++ %p%main.o %p%resource.o -o %p%my.exe

if %errorlevel% neq 0 (
    echo.
    echo ----------------------------
    echo Ошибка при сборке my.exe.
    echo ----------------------------
    echo.
    pause
    exit /b
)

    timeout 1 >nul
    echo Сборка my.exe завершена.
    echo ------------------------ 
    echo.
    echo Выход . . .
    timeout 2 >nul