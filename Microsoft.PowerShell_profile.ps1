# git
Set-PsFzfOption -TabExpansion

# oh my posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/catppuccin_mocha.omp.json" | Invoke-Expression

# anaconda
#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
# If (Test-Path "C:\Users\Hazzatur\scoop\apps\anaconda3\current\App\Scripts\conda.exe") {
#     (& "C:\Users\Hazzatur\scoop\apps\anaconda3\current\App\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
# }
#endregion

# aliases
# bat
Remove-Alias -Name 'cat'
New-Alias -Name 'cat' -Value 'bat' -Scope Global
# lunarVim
$lvimPath = Join-Path $env:USERPROFILE '\.local\bin\lvim.ps1'
Set-Alias lvim -Value $lvimPath
Set-Alias vi -Value $lvimPath

# volta
(& volta completions powershell) | Out-String | Invoke-Expression

# fzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# posh-git
Import-Module posh-git
