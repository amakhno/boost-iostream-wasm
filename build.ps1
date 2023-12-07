if ($IsLinux -or $IsMacOS) {
    & "$env:HOME/.config/powershell/Microsoft.PowerShell_profile.ps1"
    if (-Not (Test-Path ./vcpkg/vcpkg)) {
        .\vcpkg\bootstrap-vcpkg.sh
    }
}

./vcpkg/vcpkg install `
    boost-iostreams:wasm32-emscripten

emcmake cmake -B build

cmake --build build