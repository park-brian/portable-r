# portable-r

This repository contains a setup script that will:

1. Download and extract the contents of the R 3.3.0 installer for Windows 
2. Configure R to use a portable library path
3. Create a base R source file to serve as the application template
4. Create a .bat file to run the application template using Rscript

===

_Notes_

> When executing plotting functions via RScript, output will be redirected to the pdf graphics device by default. In order to display plots in a separate window, the windows() device must be selected beforehand.
