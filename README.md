## portable-r

This utility helps package R code so it can be distributed to users who may not have R installed. Please visit the [releases](https://github.com/park-brian/portable-r/releases) page to download this tool.

The installation script will: 

1. Download and extract the contents of the R 3.3.0 installer for Windows
2. Configure R to use a portable library path
3. Create a template for your portable application in the source directory
4. Create a .bat file to run the application template using Rscript

A sample application is included with this script that illustrates a possible use-case for this tool.

===

_Notes_

> When executing plotting functions via RScript, output will be redirected to the pdf graphics device by default. In order to display plots in a separate window, the windows() device must be selected beforehand.
