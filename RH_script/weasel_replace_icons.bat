@echo off
setlocal

:: 1. 备份原始文件
echo [1/4] 备份原始 DLL...
if exist "weasel.dll" copy "weasel.dll" "weasel_original.dll"
if exist "weaselx64.dll" copy "weaselx64.dll" "weaselx64_original.dll"
if exist "WeaselServer.exe" copy "WeaselServer.exe" "WeaselServer_original.exe"

:: 2. 调用上一级目录的 ResourceHacker.exe 执行脚本
:: 注意：这里使用了 ..\ 路径
echo [2/4] 正在修改 weasel.dll (x86)...
"..\ResourceHacker.exe" -script script_x86.txt

echo [3/4] 正在修改 weaselx64.dll (x64)...
"..\ResourceHacker.exe" -script script_x64.txt

echo [4/4] 正在修改 WeaselServer.exe...
"..\ResourceHacker.exe" -script script_server.txt

echo.
echo 任务完成！原始文件已备份为 *_original.dll
pause