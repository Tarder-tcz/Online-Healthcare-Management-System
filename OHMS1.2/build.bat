@echo off
REM Build script: compile Java sources in src/ to WEB-INF/classes/
SETLOCAL ENABLEDELAYEDEXPANSION

set "ROOT=%~dp0"
echo Project root: %ROOT%
if not exist "%ROOT%src" (
    echo Source folder not found: %ROOT%src
    pause
    exit /b 1
)

set "CLASSPATH=%ROOT%lib\*"
if not exist "%ROOT%WEB-INF\classes" mkdir "%ROOT%WEB-INF\classes"
del "%ROOT%sources.txt" 2>nul || echo.

rem Change to project root and write relative paths (avoids spaces in ROOT)
pushd "%ROOT%"
if exist "%ROOT%sources.txt" del "%ROOT%sources.txt"
for /R "src" %%f in (*.java) do (
    set "file=%%~f"
    setlocal enabledelayedexpansion
    rem remove the current directory prefix (%CD%\) to get a relative path
    set "file=!file:%CD%\=!"
    echo "!file!">>"%ROOT%sources.txt"
    endlocal
)
popd

if not exist "%ROOT%sources.txt" (
    echo No Java source files found under src\
    pause
    exit /b 1
)

echo Compiling using javac (ensure JDK is in PATH)...
javac -cp "%CLASSPATH%" -d "%ROOT%WEB-INF\classes" @"%ROOT%sources.txt"
if %ERRORLEVEL% neq 0 (
    echo Compilation failed. Check errors above.
    pause
    exit /b %ERRORLEVEL%
)

echo Compilation successful. Classes placed in WEB-INF\classes\
del "%ROOT%sources.txt" 2>nul || echo.
endlocal
pause
