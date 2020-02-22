$ScriptName = $MyInvocation.MyCommand.Name -replace '\.Tests\.', '.'
$ScriptFolder = Join-Path -Path $PSScriptRoot -ChildPath '..\..\PSFolderSync\Scripts' -Resolve
$Script = Join-Path -Path $ScriptFolder -ChildPath $ScriptName
. $Script

$NewFileAndFolderListScript = Join-Path -Path $PSScriptRoot -ChildPath '.\TestHelpers\New-FileAndFolderList.ps1'

Describe 'Parameters' {

    Write-Verbose -Message 'Building sandbox structure of files and folders...'
    & $NewFileAndFolderListScript

    Context 'Path parameter' {

        It -Name "should have a mandatory path parameter of type string" -Test {
            Get-Command -Name 'Get-FileSystem' |
            Should -HaveParameter 'Path' -Mandatory -Type 'System.String[]' -Because 'it should be able to process a list of paths'
        }

        It -Name 'should throw an error if the path is not a folder' -Test {
            { Get-FileSystem -Path 'TestDrive:\Folder1\File1.txt' } |
            Should -Throw -Because 'it should only accept folders as a path' -ErrorId 'ParameterArgumentValidationError,Get-FileSystem'
        }

        It -Name "should throw an error if the path does not exist" -Test {
            { Get-FileSystem -Path 'TestDrive:\Folder3' } |
            Should -Throw -Because 'the cmdlet cannot return a filesystem of a folder which does not exist' -ErrorId 'ParameterArgumentValidationError,Get-FileSystem'
        }

        It -Name "should throw an error if the path is null or empty" -Test {
            { Get-FileSystem -Path $Null } |
            Should -Throw -Because 'the cmdlet cannot return a filesystem of a folder which does not exist' -ErrorId 'ParameterArgumentValidationError,Get-FileSystem'

            { Get-FileSystem -Path '' } |
            Should -Throw -Because 'the cmdlet cannot return a filesystem of a folder which does not exist' -ErrorId 'ParameterArgumentValidationError,Get-FileSystem'
        }
    }
}

Describe "Features" {

    Write-Verbose -Message 'Building sandbox structure of files and folders...'
    & $NewFileAndFolderListScript

    Context "Folder1" {

        $FileSystemObjectList = Get-FileSystem -Path 'TestDrive:\Folder1'

        It -Name "Should return all files' and folders' metadata" -Test {
            $FileSystemObjectList.Count |
            Should -Be 7 -Because 'The function does not detect the exact number of files and folders'
        }

    }

}