@echo off

rem
rem build.bat always calls the version of ant distributed with ArgoUML
rem

setlocal
echo Searching for Ant...
:: Look in the typical command-line checkout location.
set ANT_HOME=tools\apache-ant-1.7.0
echo trying %ANT_HOME%
if exist %ANT_HOME% goto antpathok

echo Could not find Ant.
goto endfail

:antpathok
echo Ant Found

:: Convert relative path to absolute
pushd %ANT_HOME%
set ANT_HOME=%CD%
popd

:: Check JAVA_HOME variable
echo Checking JAVA_HOME...
if exist %JAVA_HOME%\bin\java.exe goto javahomeok
echo Warning: JAVA_HOME environment variable has not been set correctly
echo please set JAVA_HOME before running the build, e.g.
echo.
echo set JAVA_HOME=C:\Progra~1\Java\jdk1.6.0_10
echo.
goto javahomecheckdone
:javahomeok
echo JAVA_HOME set ok.
:javahomecheckdone

call %ANT_HOME%\bin\ant %1 %2 %3 %4 %5 %6 %7 %8 %9

if ERRORLEVEL 1 goto endfail
endlocal

goto EOF

:endfail
echo.
echo Build failed
:: Wait for keypress so that error messages can be read.
:: (Helps if user double clicked this .bat file)
pause
endlocal

:EOF