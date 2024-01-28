if ($env:_BUILD_BRANCH -eq "refs/heads/master" -Or $env:_BUILD_BRANCH -eq "refs/tags/canary") {
  $env:_IS_BUILD_CANARY = "true"
  $env:_IS_GITHUB_RELEASE = "true"
}
elseif ($env:_BUILD_BRANCH -like "refs/tags/*") {
  $env:_BUILD_VERSION = $env:_BUILD_VERSION.Substring(0,$env:_BUILD_VERSION.LastIndexOf('.')) + ".0"
  $env:_IS_GITHUB_RELEASE = "true"
}
$env:_RELEASE_VERSION = "v${env:_BUILD_VERSION}"

Write-Output "--------------------------------------------------"
Write-Output "CANARY: $env:_IS_BUILD_CANARY"
Write-Output "RELEASE VERSION: $env:_RELEASE_VERSION"
Write-Output "--------------------------------------------------"

Write-Output "_BUILD_VERSION=${env:_BUILD_VERSION}" >> ${env:GITHUB_ENV}
Write-Output "_RELEASE_VERSION=${env:_RELEASE_VERSION}" >> ${env:GITHUB_ENV}
Write-Output "_IS_BUILD_CANARY=${env:_IS_BUILD_CANARY}" >> ${env:GITHUB_ENV}
Write-Output "_IS_GITHUB_RELEASE=${env:_IS_GITHUB_RELEASE}" >> ${env:GITHUB_ENV}

# x86
mkdir .dist\x86\bin\steam | Out-Null
mkdir .dist\x86\lib\steam | Out-Null
mkdir .dist\x86\include\steam | Out-Null
Move-Item steamworks_sdk\public\steam\*.h .dist\x86\include\steam
Move-Item steamworks_sdk\redistributable_bin\*.lib .dist\x86\lib\steam\
Move-Item steamworks_sdk\redistributable_bin\*.dll .dist\x86\bin\steam\
Move-Item steamworks_sdk\redistributable_bin\linux32\*.so .dist\x86\lib\steam\
Move-Item steamworks_sdk\public\steam\lib\win32\*.lib .dist\x86\lib\steam\
Move-Item steamworks_sdk\public\steam\lib\win32\*.dll .dist\x86\bin\steam\
Move-Item steamworks_sdk\public\steam\lib\linux32\*.so .dist\x86\lib\steam\

# x64
mkdir .dist\x64\bin\steam | Out-Null
mkdir .dist\x64\lib\steam | Out-Null
mkdir .dist\x64\include\steam | Out-Null
Copy-Item .dist\x86\include\steam\*.h .dist\x64\include\steam
Move-Item steamworks_sdk\redistributable_bin\win64\*.lib .dist\x64\lib\steam\
Move-Item steamworks_sdk\redistributable_bin\win64\*.dll .dist\x64\bin\steam\
Move-Item steamworks_sdk\redistributable_bin\linux64\*.so .dist\x64\bin\steam\
Move-Item steamworks_sdk\redistributable_bin\osx\*.dylib .dist\x64\lib\steam\
Move-Item steamworks_sdk\public\steam\lib\win64\*.lib .dist\x64\lib\steam\
Move-Item steamworks_sdk\public\steam\lib\win64\*.dll .dist\x64\bin\steam\
Move-Item steamworks_sdk\public\steam\lib\linux64\*.so .dist\x64\lib\steam\
Move-Item steamworks_sdk\public\steam\lib\osx\*.dylib .dist\x64\lib\steam\

Compress-Archive -Path .dist\x86\* -DestinationPath ".dist\${env:_RELEASE_NAME}-${env:_RELEASE_VERSION}_x86.zip"
Compress-Archive -Path .dist\x64\* -DestinationPath ".dist\${env:_RELEASE_NAME}-${env:_RELEASE_VERSION}_x64.zip"
