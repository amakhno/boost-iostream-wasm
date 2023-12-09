$emVersion = "3.1.8"

# Setup emscript
# See https://github.com/microsoft/vcpkg/commit/0551bc744c8165449acefb6778407e05da3129a2#diff-b297a7daecb6dfa4d1baaf0df098650606dc3c51ec9c24f0950ac916c583fb10
if ($IsWindows) {
    emcc -v
    if (-not $?) {
        # Seems like we don't have emcc
        .\emsdk\emsdk.ps1 install $emVersion
        .\emsdk\emsdk.ps1 activate $emVersion
    }
}

if ($IsLinux -or $IsMacOS) {
    & "$env:HOME/.config/powershell/Microsoft.PowerShell_profile.ps1"
    if (-Not (Test-Path ./vcpkg/vcpkg)) {
        .\vcpkg\bootstrap-vcpkg.sh
    }
} else {
    if (-Not (Test-Path ./vcpkg/vcpkg.exe)) {
        .\vcpkg\bootstrap-vcpkg.bat
    }
}

./vcpkg/vcpkg install `
    boost-thread:wasm32-emscripten

if (-not $?) {
    throw "vcpkg error"
}

emcmake cmake -B build

cmake --build build