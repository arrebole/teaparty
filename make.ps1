# pwsh

$MODE_PATH = "D:\\PlayGames\\Steam\\steamapps\\common\\Don't Starve Together\\mods\\teaparty"
$MODE_EXPORTED_PATH = $MODE_PATH + "\\exported"

$TOOLS_PATH = "D:\\PlayGames\\Steam\\steamapps\\common\\Don't Starve Mod Tools\mod_tools\\"
$TOOLS_AUTOCOMPILER_PATH = $TOOLS_PATH + "autocompiler.exe"
$TOOLS_PNGCOMPILER_PATH = $TOOLS_PATH + "png.exe"
$TOOLS_SCMLCOMPILER_PATH = $TOOLS_PATH + "scml.exe"


#  如果没有mod文件夹则创建
if (-Not (Test-Path $MODE_PATH))
{
     mkdir -path $MODE_PATH
}
# 将当前目录下的文件安装到游戏mod目录下
Remove-Item ($MODE_PATH + "\*") -Recurse
Copy-Item "./*" -Destination $MODE_PATH -Recurse

# 编译
Start-Process -FilePath $TOOLS_AUTOCOMPILER_PATH -NoNewWindow -Wait

# 清理需要动画编译前的源文件
if (Test-Path $MODE_EXPORTED_PATH) {
     Remove-Item $MODE_EXPORTED_PATH -Recurse -Force
}
