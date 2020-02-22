function Invoke-OneWaySync {
    <#
    .SYNOPSIS
        Synchronizes elements from one folder to the other
    .DESCRIPTION
        Synchronizes elements from one folder to the other
    .EXAMPLE
        Invoke-OneWaySync -ReferencePath C:\Folder1 -DifferencePath C:\Folder2

        Explanation of what the example does
    .INPUTS
        'System.String'
    .OUTPUTS
        None
    #>

    [CmdletBinding()]

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
        [string]$ReferencePath,

        [Parameter(
            Mandatory,
            Position = 2,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [ValidateScript( { (Get-Item -Path $PSItem).PSIsContainer })]
        [ValidateScript( { Test-Path -Path $PSItem })]
        [ValidateNotNullOrEmpty()]
        [string]$DifferencePath
    )

    process {
        $ReferenceObjectList = Get-FileSystem -Path $ReferencePath

        $DifferenceObjectList = Get-FileSystem -Path $DifferencePath

        $DeltaList = Compare-Object -ReferenceObject $ReferenceObjectList -DifferenceObject $DifferenceObjectList








    }
}