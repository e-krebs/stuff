# Install
## Windows
to install dependencies on a new system, run **as an administrator**:
```ps1
# this will install dependencies and/or open links to install dependencies
./install.sh
```
then to bind the different settings/profiles, you can run (still **as an administrator**)
```ps1
# this will create symlinks
./bind.sh
```

## Wsl
> TODO, cf. https://github.com/aseure/configs

# Windows-related stuff

## **Windows Terminal** [settings](/windows/settings.json)
### currently, version: 1.1.2021.0
> To open your **settings**:
> 1. click the _down carret_ at the end of the Tabs
> 2. choose **Settings**

This settings do:
- uses _Fira code_ as a font
- uses _Tango Dark_ theme + dark background
- set some keybindings:
  - _**duplicate** Tab_: <kbd>ctrl</kbd>+<kbd>t</kbd>,
  - _**close** Tab_: <kbd>ctrl</kbd>+<kbd>w</kbd>,
  - _**duplicate** Pane_: <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>t</kbd>,
  - _**close** Pane_: <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>w</kbd>,
  - _move **focus right**_: <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>right</kbd>,
  - _move **focus left**_: <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>left</kbd>

> To **reset** your current settings:
> 1. empty the existing settings and save
> 2. open a new Windows Terminal

Full settings doc [here](https://github.com/microsoft/terminal/blob/master/doc/cascadia/SettingsSchema.md).

## PowerShell [startup script](/windows/profile.ps1)
> I'm used to put all my projects in `C:\Projects`.

This script does:
 - **open** every new Powershell window in `C:\Projects`
 - **list** this folder content

This script has to be at the following path: `C:\Users\{username}\Documents\WindowsPowerShell\profile.ps1`

## Windows [startup script](/windows/startup.cmd)
Any script you want to be **executed at startup** can be placed in `C:\Users\{username}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

For each script you put in that folder, when opening a new Windows session, you will briefly see a terminal being opened (and then closed when the script has finished running).
> You can even run a `wsl` command here.

# Wsl-related stuff
> **wsl** stands for _Windows Sub-system for Linux_,
> cf. [Microsoft Doc](https://docs.microsoft.com/en-us/windows/wsl/about) 

## Bash startup script
To run something every time a new bash shell is opened, you just have to add it to `~/.bashrc`.

To do do something similar to what I've described above for [PowerShell](#powershell-startup-script), just add this line at the end of your `~.bashrc` file:
```sh
# assuming your 'projects' folder is relative to your personal folder (/mnt/c/Users/{username})
cd projects && ls
```

## Wsl startup script
> make sure your startup script is executable: `chmod +x /path/to/my/script.sh`

if your startup script needs `sudo` privileges, run `sudo visudo`, and at the end of the file, add:
```sh
%sudo ALL=NOPASSWD:/path/to/my/script.sh
```

Then in the case of wsl, you can write a [Windows startup script](#windows-startup-script) that will run your linux script :
```cmd
wsl sudo /path/to/my/script.sh
```

### redis
the main startup script I'm using is for lanching **redis**:
[windows script](/wsl/startup-redis.cmd) & [linux script](/wsl/start-redis.sh)

# Git-related stuff

## PowerShell
I'm using [posh-git](https://github.com/dahlbyk/posh-git) to display the current folder git status in the PowerShell prompt.
To install, run as an Admin:
```ps
Install-Module posh-git
```
Then you can run:
```ps
Add-PoshGitToProfile
```
This should add a line to your [PowerShell profile](/windows/Microsoft.PowerShell_profile.ps1) (type `$profile` to get the path):
```ps
Import-Module posh-git
```

After that, I you want to customize what posh-git displays, you can add it to your profile after that line, in my case:
```ps
$GitPromptSettings.EnableFileStatus = $false
```

## Wsl
to display the current folder git status in the wsl terminal, add these simple two lines in your [`.bashrc`](/wsl/.bashrc):
```sh
parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' ; }
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```
