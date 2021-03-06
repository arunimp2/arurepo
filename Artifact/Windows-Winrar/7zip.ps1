﻿function install-7zip{
$7Zip = $true;
<#
.Synopsis
Installs 7-Zip for 64-bit Windows x64 (Intel 64 or AMD64)
.Description
This function Installs 7-Zip for 64-bit Windows x64 (Intel 64 or AMD64)
 
.Example
.\install-7zip
This example installs 7-Zip for 64-bit Windows x64 (Intel 64 or AMD64)
#>
$WebClient = New-Object -TypeName System.Net.WebClient;
$7ZipUrl = ‘http://downloads.sourceforge.net/sevenzip/7z920-x64.msi';
$7ZipInstaller = “$env:TEMP\7z920-x64.msi”;
 
 
try {
 
$7ZipPath = Resolve-Path -Path ((Get-Item -Path HKLM:\SOFTWARE\7-Zip -ErrorAction SilentlyContinue).GetValue(“Path”) + ‘\7z.exe’);
if (!$7ZipPath) {
$7Zip = $false;
}
}
catch {
$7Zip = $false;
}
 
 
 
if (!$7Zip) {
$WebClient.DownloadFile($7ZipUrl,$7ZipInstaller);
Start-Process -Wait -FilePath $7ZipInstaller;
Remove-Item -Path $7ZipInstaller -Force -ErrorAction SilentlyContinue;
}
else
{
   Write-Warning &amp;quot;7 Zip already installed&amp;quot; 
}
}