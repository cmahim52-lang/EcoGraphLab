@echo off
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
  echo Run build_windows.bat first to install dependencies.
  pause
  exit /b 1
)
call ".venv\Scripts\activate.bat"
python "src\EcoGraphLab.py"
