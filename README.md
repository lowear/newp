# newp - New Project
newp is a simple .bat file for initalising new python projects.

Initialising a project with newp does the following:
1. Creates a new conda environment for the project
2. Creates a new working environment for the project
3. Creates a new github repository for the project and initialises it with a README.md and .gitignore
4. Creates a web shortcut to the project's github page in the working directory
5. Configures the conda environment to move to the project's working environment and open the project in Visual Stuido Code when the environment is activated

Creating a new project with newp is a simple as running the following command:

```bash
newp projectname
```

## Prerequisites
- Anaconda / Miniconda
- Visual Studio Code
- Git
- github cli api

## Installation
- Paste newp.bat into your default anaconda directory

## Usage
- Call the following command in anaconda prompt to initiate a new project

```bash
newp projectname
```