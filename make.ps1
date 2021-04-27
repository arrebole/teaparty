# pwsh

$MODE_PATH = "D:\\PlayGames\\Steam\\steamapps\\common\\Don't Starve Together\\mods\\teaparty"
$COMPILER_PATH = "D:\\PlayGames\\Steam\\steamapps\\common\\Don't Starve Mod Tools\mod_tools\\autocompiler.exe"

function clean {
     if (-Not (Test-Path $MODE_PATH))
     {
          return
     }
     Remove-Item $MODE_PATH -Recurse -Force
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

clean && copyCache && build
