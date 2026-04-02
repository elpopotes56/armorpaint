# ArmorPaint on Windows with Build Tools on `D:`

This repo was built on Windows with Visual Studio Build Tools installed primarily on `D:` to reduce space usage on `C:`.

## Paths used

- Repo: `D:\MAIN\worflow\laboral\armorpaint`
- Build Tools: `D:\VS\BuildTools2022`
- Visual Studio cache: `D:\VS\Cache`
- Shared components: `D:\VS\Shared`

## Installed components

- `Microsoft.VisualStudio.Workload.VCTools`
- `Microsoft.VisualStudio.Component.VC.Tools.x86.x64`
- `Microsoft.VisualStudio.Component.VC.Llvm.Clang`
- `Microsoft.VisualStudio.Component.VC.Llvm.ClangToolset`
- `Microsoft.VisualStudio.Component.Windows11SDK.26100`

## Notes

- Visual Studio still uses some space on `C:` for installer metadata and temporary files.
- ArmorPaint does not run correctly from `build\x64\Release` by itself. The executable needs to be copied to `build\out` and launched from there so the runtime assets are next to the binary.
- The helper script `dev_windows.ps1` automates project generation, compilation, copying the executable to `build\out`, and optional launch.

## Build

```powershell
powershell -ExecutionPolicy Bypass -File D:\MAIN\worflow\laboral\armorpaint\paint\dev_windows.ps1
```

## Build and run

```powershell
powershell -ExecutionPolicy Bypass -File D:\MAIN\worflow\laboral\armorpaint\paint\dev_windows.ps1 -Run
```
