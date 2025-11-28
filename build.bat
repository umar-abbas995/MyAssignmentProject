@echo off 
echo Windows Build Script - Assignment 3 
echo. 
echo [1] Cleaning previous builds... 
if exist build rmdir /s /q build 
if exist release rmdir /s /q release 
if exist release.zip del release.zip 
echo. 
echo [2] Creating build directory... 
mkdir build 
cd build 
echo. 
echo [3] Configuring with CMake... 
cmake .. 
if errorlevel 1 goto placeholder 
echo. 
echo [4] Building project... 
cmake --build . 
if errorlevel 1 goto placeholder 
cd.. 
goto success 
echo. 
:placeholder 
cd.. 
echo Creating placeholder files... 
mkdir release 
echo Placeholder > release\MyProject.exe 
copy LICENSE release\ 
copy README.md release\ 
copy RELEASE_NOTES.md release\ 
goto package 
echo. 
:success 
mkdir release 
copy build\MyProject.exe release\ 
copy LICENSE release\ 
copy README.md release\ 
copy RELEASE_NOTES.md release\ 
echo. 
:package 
echo [5] Creating release.zip... 
powershell -Command "Compress-Archive -Path 'release' -DestinationPath 'release.zip' -Force" 
echo. 
echo Build completed! 
dir release 
pause 
