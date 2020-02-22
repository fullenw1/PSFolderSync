function Get-FileSystem {
    <#
    .SYNOPSIS
        Returns all folders, subfolders and files from a specified folder
    .DESCRIPTION
        Returns all folders, subfolders and files from a specified folder
    .EXAMPLE
        Get-FileSystem -Path C:\Folder1

        Returns all folders, subfolders and files from C:\Folder1
    .INPUTS
        'System.String'
    .OUTPUTS
        'System.IO.FileSystemInfo'
    #>

    [CmdletBinding()]

    [OutputType('System.IO.FileSystemInfo')]

    param(
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [ValidateScript( { (Get-Item -Path $PSItem).PSIsContainer })]
        [ValidateScript( { Test-Path -Path $PSItem })]
        [ValidateNotNullOrEmpty()]
        [string[]]$Path
    )

    process {
        foreach ($PathItem in $Path) {
            Get-ChildItem -Path $PathItem -Recurse -Force
        }
    }
}