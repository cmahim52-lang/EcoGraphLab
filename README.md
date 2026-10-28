# EcoGraph Lab — Windows build

This package contains the EcoGraph Lab Python source and Windows build/install scripts.
The macOS `.app` build is not used for Windows. Windows requires its own `.exe`.

## Build on your Windows PC

1. Install **Python 3.12 (64-bit)** from https://www.python.org/downloads/windows/.
   During installation, enable **Add Python to PATH**.
2. Extract this package to a normal folder, for example `C:\EcoGraphLab`.
3. Double-click `build_windows.bat`. It creates a virtual environment, installs the
   dependencies and builds `dist\EcoGraph Lab.exe`.
4. Run the generated executable. Keep the `.exe` in a writable folder; the app
   stores its log/configuration under your Windows user profile.

The build script uses PyInstaller's one-file, windowed mode. It does not require
Python to be installed on the end user's computer.

## Run from source

Double-click `build_windows.bat` once to install dependencies, then use
`run_windows.bat` to launch the Python source.

## Build through GitHub Actions

1. Create a GitHub repository and upload the contents of this folder
   (the `src` directory, `.github`, `requirements.txt`, and the batch files).
2. In GitHub, open **Actions** and enable workflows if prompted.
3. Choose **Build EcoGraph Lab for Windows** → **Run workflow**.
4. When complete, open the workflow run and download the
   `EcoGraph-Lab-Windows` artifact. It contains `EcoGraph Lab.exe`.
5. To publish a GitHub Release automatically, create and push a version tag,
   e.g. `v1.0.0`. The workflow attaches the Windows executable to the release.

## Notes

- Build Windows executables on Windows (locally or via GitHub Actions). A macOS
  PyInstaller build does not produce a Windows `.exe`.
- The source is kept as a single Python entry point in `src/EcoGraphLab.py`.
- If a security prompt appears for an unsigned executable, choose **More info**
  → **Run anyway** only if you trust the repository/source you built.
- This package does not claim that Windows runtime testing has been completed:
  the executable must be built and launched on Windows to verify Qt plugins,
  graph rendering, file exports, and all self-tests.
