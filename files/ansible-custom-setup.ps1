# This is custom setup the agent env from Andrew Dean to make the build process to work

Start-Process "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vs_installer.exe" -ArgumentList 'modify --installPath "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools" --quiet --add Microsoft.VisualStudio.Component.NuGet.BuildTools --add Microsoft.Net.Component.4.5.TargetingPack --norestart --force' -Wait -PassThru

[Environment]::SetEnvironmentVariable("MSBuildSDKsPath", "C:\Program Files\dotnet\sdk\2.1.3\Sdks", "Machine")
