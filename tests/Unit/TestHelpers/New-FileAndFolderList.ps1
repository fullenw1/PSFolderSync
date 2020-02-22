New-Item -ItemType Directory -Path 'TestDrive:\Folder1'
New-Item -ItemType File -Path 'TestDrive:\Folder1\File1.txt' -Value 'File1'
New-Item -ItemType File -Path 'TestDrive:\Folder1\File2.txt' -Value 'File2'

New-Item -ItemType Directory -Path 'TestDrive:\Folder1\Folder11'
New-Item -ItemType File -Path 'TestDrive:\Folder1\Folder11\File11.txt' -Value 'File11'
New-Item -ItemType File -Path 'TestDrive:\Folder1\Folder11\File12.txt' -Value 'File12'
New-Item -ItemType File -Path 'TestDrive:\Folder1\Folder11\File13.txt' -Value 'File13'

New-Item -ItemType Directory -Path 'TestDrive:\Folder2'
New-Item -ItemType File -Path 'TestDrive:\Folder2\File1.txt' -Value 'File1'

New-Item -ItemType Directory -Path 'TestDrive:\Folder2\Folder21'
New-Item -ItemType Directory -Path 'TestDrive:\Folder2\Folder21\Folder211'
New-Item -ItemType Directory -Path 'TestDrive:\Folder2\Folder22'
New-Item -ItemType File -Path 'TestDrive:\Folder2\Folder22\File21.txt' -Value 'File21'
