Write-Host "===== Azure VM Health Check ====="

Write-Host "`nCPU Information:"
Get-WmiObject win32_processor | Select LoadPercentage

Write-Host "`nMemory Information:"
Get-WmiObject Win32_OperatingSystem | Select TotalVisibleMemorySize,FreePhysicalMemory

Write-Host "`nDisk Information:"
Get-WmiObject Win32_LogicalDisk | Select DeviceID,FreeSpace,Size

Write-Host "`nRunning Services:"
Get-Service | Where-Object {$_.Status -eq "Running"} | Select -First 10