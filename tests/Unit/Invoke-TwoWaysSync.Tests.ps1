$ScriptName = $MyInvocation.MyCommand.Name -replace '\.Tests\.', '.'
$ScriptFolder = Join-Path -Path $PSScriptRoot -ChildPath '..\..\Scripts' -Resolve
$Script = Join-Path -Path $ScriptFolder -ChildPath $ScriptName
. $Script

Describe 'Parameters' {
    Context 'Path' {
        It 'Should be a folder' {
        }

        It 'Should exist' {
        }
    }
}

Describe "Features" {
    It "" {
    }
}