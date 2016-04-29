
rm -rf .tmp && mkdir .tmp && cd .tmp

# Download R 3.2.5 for Windows
echo $'\n-- Downloading R 3.2.5 for Windows (https://cran.r-project.org/bin/windows/base/R-3.2.5-win.exe) --\n'
curl -O https://cran.r-project.org/bin/windows/base/R-3.2.5-win.exe

# Download InnoExtract (https://github.com/dscharrer/innoextract)
echo $'\n-- Downloading InnoExtract (https://github.com/dscharrer/innoextract/releases/download/1.6/innoextract-1.6-windows.zip) --\n'
curl -O -L https://github.com/dscharrer/innoextract/releases/download/1.6/innoextract-1.6-windows.zip

echo $'\n-- Unzipping InnoExtract --\n'
unzip innoextract-1.6-windows.zip

echo $'\n-- Running InnoExtract on downloaded archive --\n'
winpty innoextract.exe -d ../ R-3.2.5-win.exe

echo $'\n-- Removing .tmp directory --\n'
cd .. && rm -rf .tmp

echo $'\n-- Setting portable R library path --\n'
echo ".First = function() { .libPaths(.Library) }" >> app/etc/Rprofile.site

echo "cd app/bin/i386 && Rscript.exe ../../../source/app.R" > run.bat
echo $'\n-- Finished setup. Please double-click on the run.bat file to start this application --\n'
