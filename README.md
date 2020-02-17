# Windows-related stuff

## **Windows Terminal** [profile](/windows/profiles.json)
### currently, version: 0.9.433.0
> To open your **profile**:
> 1. click the _down carret_ at the end of the Tabs
> 2. choose **Settings**

This profile does:
- uses _Fira code_ as a font
- set some keybindings:
  - _**close** Tab_: <kbd>ctrl</kbd>+<kbd>w</kbd>,
  - _**duplicate** Tab_: <kbd>ctrl</kbd>+<kbd>t</kbd>,
  - _**split** Pane_ vertically: <kbd>ctrl</kbd>+<kbd>p</kbd> (new tab will be _wsl_),
  - _move **focus right**_: <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>right</kbd>,
  - _move **focus left**_: <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>left</kbd>

> To **reset** your current profile:
> 1. empty the existing profile and save
> 2. open a new Windows Terminal

Full profile doc [here](https://github.com/microsoft/terminal/blob/master/doc/cascadia/SettingsSchema.md).

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
