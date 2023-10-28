@echo off

set "psCommand=powershell -Command ""$replacement = Get-Content -Raw -Path 'win-cmd.txt'; $content = Get-Content -Raw -Path 'rclone\Makefile'; $pattern = '(?s)(rclone:.*?\r?\ntest_all:)'; $editedText = $content -replace $pattern, $replacement; Set-Content -Value $editedText -Path 'rclone\Makefile'; $pattern = '(?s)(\# Version of last release \(may not be on this branch\).*?\r?\n\# Last tag on this branch)'; $content = Get-Content -Raw -Path 'rclone\Makefile'; $editedText = $content -replace $pattern, ''; Set-Content -Value $editedText -Path 'rclone\Makefile'; $pattern = '(?s)(\# Next version.*?\r?\n\# If we are working on a release, override branch to master)'; $content = Get-Content -Raw -Path 'rclone\Makefile'; $editedText = $content -replace $pattern, ''; Set-Content -Value $editedText -Path 'rclone\Makefile';""

%psCommand%
