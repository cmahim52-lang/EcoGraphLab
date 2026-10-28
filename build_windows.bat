@echo off
setlocal
cd /d "%~dp0"
echo ============================================
echo EcoGraph Lab - Windows build
echo ============================================
where py >nul 2>nul
if errorlevel 1 (
  echo Python launcher not found. Install Python 3.11 or 3.12 from python.org.
  echo During setup, enable "Add Python to PATH".
  pause
  exit /b 1
)
if not exist ".venv" (
  py -3.12 -m venv .venv
  if errorlevel 1 py -3.11 -m venv .venv
)
call ".venv\Scripts\activate.bat"
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
if errorlevel 1 (
  echo Dependency installation failed.
  pause
  exit /b 1
)
python -m PyInstaller --clean --noconfirm --windowed --onefile --name "EcoGraph Lab" --collect-all PySide6 --collect-all matplotlib --collect-all openpyxl --collect-all docx "src\EcoGraphLab.py"
if errorlevel 1 (
  echo Build failed. Review the error output above.
  pause
  exit /b 1
)
echo.
echo BUILD COMPLETE:
echo %CD%\dist\EcoGraph Lab.exe
echo.
pause
