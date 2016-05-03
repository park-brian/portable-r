# r-standalone-application

This repository contains a setup script that will:

1. Download the R 3.2.5 installer for Windows (https://cran.r-project.org/bin/windows/base/R-3.2.5-win.exe)
2. Download InnoExtract (https://github.com/dscharrer/innoextract/releases/download/1.6/innoextract-1.6-windows.zip)
3. Extract the contents of the R installation package
4. Set R to use a portable library path
5. Create a .bat file to run the application template using Rscript

To create a portable application template, run the setup.hta file.