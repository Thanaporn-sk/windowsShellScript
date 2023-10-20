#Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# CREATE BAT FILE FOR MAP DRIVE SCRIPT 

$FilePath = "C:\temp\"
$batFileName ="mapDrive.bat"
$fullPath = "C:\temp\mapDrive.bat";
$MapDrivePath = "C:\\temp\\"
$filter = "Label is not null"

$HD_LIST = Get-WmiObject -class Win32_Volume  -Filter "$filter" | Select-Object Label,DeviceID  |sort-object -Property Label

$HD_LIST |Out-File $FilePath 
ForEach ($hd in $HD_LIST){
if($hd.Label -ne $null){
  # $hd.Label +'   ' + $hd.DeviceID 
     
    if (!(Test-Path $FullPath))
        {
            New-Item -path $FilePath -name $batFileName -type "file" -value "REM BAT file for create map HDD Drive to Folder\n"
            Write-Host "Created new file and text content added"
        } else {
             $createFolderCmd = "MKDIR  " + $hd.Label
             $createMapDriveCmd = "MOUNTVOL  "+ $hd.Label +" "+ $hd.DeviceID

            Add-Content -path $fullPath -value $createFolderCmd
            Add-Content -path $fullPath -value $createMapDriveCmd
            Write-Host "File already exists and new text content added"
        }
   }
   # Out-File 
}
