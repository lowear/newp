:: This script uses the github cli api
:: https://github.com/cli/cli
:: Instuctions for use @ https://www.techielass.com/create-a-new-github-repository-from-the-command-line/
:: gh auth login

:: Set arguments
set name=%1
set root=C:\Users\aaron\git
set envs=C:\Users\aaron\miniconda3\envs
set user=lowear

:: Create new conda env
cmd /C conda create -n %name% python=3

:: Create working directory
mkdir %root%\%name%

:: Create README.md in the working directory
type nul > %root%\%name%\README.md
echo # %name% >> %root%\%name%\README.md

:: Create .gitignore in the working directory
type nul > %root%\%name%\.gitignore
echo .gitignore >> %root%\%name%\.gitignore
echo github_repo.url >> %root%\%name%\.gitignore

:: Create conda env Activate.d file
mkdir %envs%\%name%\etc\conda\Activate.d
type nul > %envs%\%name%\etc\conda\Activate.d\set_working_directory.bat
echo @echo off >> %envs%\%name%\etc\conda\Activate.d\set_working_directory.bat
echo cd %root%\%name% >> %envs%\%name%\etc\conda\Activate.d\set_working_directory.bat
echo code . >> %envs%\%name%\etc\conda\Activate.d\set_working_directory.bat

:: Init git repository
cd %root%\%name%
git init
git add README.md
git commit -m "first commit"
gh repo create %name% --public --source=. --remote=upstream --push

:: Create shortcut to git repository
echo [InternetShortcut] > %root%\%name%\github_repo.url
echo URL=https://github.com/%user%/%name% >> %root%\%name%\github_repo.url

:: Activate the new environment
activate %name%