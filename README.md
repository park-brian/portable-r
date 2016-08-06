## portable-r

This utility helps package R code so it can be distributed to users who may not have R installed. Please visit the [releases](https://github.com/park-brian/portable-r/releases) page to download this tool.

The installation script will: 

1. Download [R 3.3.0 for Windows](https://cran.r-project.org/bin/windows/base/old/3.3.0/)
2. Extract R from the installer using [innoextract](https://github.com/dscharrer/innoextract)
3. Configure R to use a portable library path
4. Create a portable application template in the source directory

A sample application is included with this script that illustrates a possible use-case for this tool.

===

_Notes_

> The installation file is created with NSIS, which is an open-source scriptable install system. To create an installer for your R application, clone this repository, overwrite the application.R file in the resources/source directory, update the configuration file with application-specific settings, and then rebuild the .exe with MakeNSISW. Let me know if you run into any issues!
