param(
    [switch]$Run
)

$ErrorActionPreference = "Stop"

$paintDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoDir = Split-Path -Parent $paintDir
$amake = Join-Path $repoDir "base\tools\bin\windows_x64\amake.exe"
$makeJs = Join-Path $repoDir "base\tools\make.js"
$msbuild = "D:\VS\BuildTools2022\MSBuild\Current\Bin\MSBuild.exe"
$project = Join-Path $paintDir "build\ArmorPaint.vcxproj"
$releaseExe = Join-Path $paintDir "build\x64\Release\ArmorPaint.exe"
$outDir = Join-Path $paintDir "build\out"
$outExe = Join-Path $outDir "ArmorPaint.exe"

if (!(Test-Path $amake)) {
    throw "No se encontro amake.exe en $amake"
}

if (!(Test-Path $msbuild)) {
    throw "No se encontro MSBuild en $msbuild"
}

Push-Location $paintDir
try {
    & $amake $makeJs
    if ($LASTEXITCODE -ne 0) {
        throw "Fallo la generacion del proyecto."
    }

    & $msbuild $project /m /clp:ErrorsOnly /p:Configuration=Release,Platform=x64
    if ($LASTEXITCODE -ne 0) {
        throw "Fallo la compilacion con MSBuild."
    }

    Copy-Item $releaseExe $outExe -Force

    if ($Run) {
        Start-Process -FilePath $outExe -WorkingDirectory $outDir
    }
}
finally {
    Pop-Location
}
