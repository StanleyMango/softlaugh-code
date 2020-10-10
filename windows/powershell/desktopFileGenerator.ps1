function CreateTextFilesOnTheDesktop {
    param (
        [Parameter(Mandatory)]
        [long] $FileCount
    )

    $desktopPath = [System.Environment]::GetFolderPath('Desktop')
    $numbserOfFilesOnTheDesktop = (Get-ChildItem -Path "$desktopPath").Count

    for (; $numbserOfFilesOnTheDesktop -lt $FileCount; $numbserOfFilesOnTheDesktop++) {
        $percentCompleted = $numbserOfFilesOnTheDesktop / $FileCount * 100
        $status = "Made $numbserOfFilesOnTheDesktop of $FileCount"
        Write-Progress -Activity "Creating Files" -PercentComplete $percentCompleted -Status $status
        Out-File ($desktopPath + "\$numbserOfFilesOnTheDesktop.txt")
    }
}

CreateTextFilesOnTheDesktop -FileCount (Read-Host -Prompt 'How many files do you want to make?')
