@echo off
REM Wrapper: call project-root build.bat (one level up)
call "%~dp0..\build.bat"
pause
