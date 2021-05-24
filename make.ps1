# pwsh

$MODE_PATH = "D:\\PlayGames\\Steam\\steamapps\\common\\Don't Starve Together\\mods\\teaparty"
$MODE_EXPORTED_PATH = $MODE_PATH + "\\exported"
$COMPILER_PATH = "D:\\PlayGames\\Steam\\steamapps\\common\\Don't Starve Mod Tools\mod_tools\\autocompiler.exe"

function clean {
     param ($path)

     if (-Not (Test-Path $path))
     {
          return
     }
     Remove-Item $path -Recurse -Force
}

function copyCache {
     if (-Not (Test-Path $MODE_PATH))
     {
          mkdir -path $MODE_PATH
     }
     Copy-Item "./*" -Destination $MODE_PATH -Recurse
     
}

function build {
     Start-Process -FilePath $COMPILER_PATH -NoNewWindow -Wait
}

clean $MODE_PATH && copyCache && build && clean $MODE_EXPORTED_PATH
