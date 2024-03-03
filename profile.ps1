# Add this line (with your login user!) to the bottom of your PowerShell profile configuration
$Env:KOMOREBI_CONFIG_HOME = 'C:\Users\csdem\.config\komorebi'
oh-my-posh init pwsh --config 'C:\Users\csdem\AppData\Local\Programs\oh-my-posh\themes\tokyo.omp.json' | Invoke-Expression
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
