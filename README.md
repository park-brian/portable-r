# r-standalone-application

This repository contains a setup script that will:

1. Download the R 3.2.5 installer for Windows (https://cran.r-project.org/bin/windows/base/R-3.2.5-win.exe)
2. Extract the contents of the R installation package using InnoExtract (https://github.com/dscharrer/innoextract)
3. Configure R to use a portable library path
4. Create a base R source file to serve as the application template
5. Create a .bat file to run the application template using Rscript

------

_Notes_

> When executing plotting functions via RScript, output will be redirected to the pdf graphics device by default. In order to display plots to the user, the windows() device must be selected before creating any plots.
