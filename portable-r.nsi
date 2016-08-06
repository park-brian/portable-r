#### Default Values ####

# Set application name
Name "Portable R"

# Set name of executable to generate
OutFile "portable-r.exe"

# Do not request administrative privileges
RequestExecutionLevel user

# Set default installation directory
InstallDir "$EXEDIR\portable-r"

#### End Default Values ####


#### Pages ####

# License/instructions page
PageEx license
  Caption ": Instructions"
  LicenseText "Please review the installation procedure before continuing the setup process."
  LicenseData "resources\instructions.txt"
PageExEnd

# Directory selection page
Page directory

# Installation Progress Page
Page instfiles

#### End Pages ####


#### Installation ####
Section "install"

RMDir /r "$INSTDIR\app"
RMDir /r "$INSTDIR\source"
RMDir /r "$INSTDIR\tmp"

createDirectory "$INSTDIR\app"
createDirectory "$INSTDIR\source"
createDirectory "$INSTDIR\tmp"

# Download Resources (R/innoextract)
NSISdl::download http://cran.r-project.org/bin/windows/base/old/3.3.0/R-3.3.0-win.exe "$INSTDIR\tmp\R-3.3.0-win.exe"
NSISdl::download http://constexpr.org/innoextract/files/innoextract-1.6/innoextract-1.6-windows.zip "$INSTDIR\tmp\innoextract-1.6-windows.zip"

# Extract Resources
nsisunz::UnzipToLog /file "innoextract.exe" "$INSTDIR\tmp\innoextract-1.6-windows.zip" "$INSTDIR\tmp"
nsExec::ExecToLog '"$INSTDIR\tmp\innoextract.exe" -d "$INSTDIR" "$INSTDIR\tmp\R-3.3.0-win.exe"'

# Make R Portable
FileOpen $4 "$INSTDIR\app\etc\RProfile.site" a
FileSeek $4 0 END
FileWrite $4 "$\r$\n"
FileWrite $4 ".First = function() .libPaths(.Library)"
FileWrite $4 "$\r$\n"
FileClose $4

# Copy Files
setOutPath "$INSTDIR\source"
file "resources\application.R"

CreateShortCut "$INSTDIR\application.lnk" "$SYSDIR\cmd.exe" "/c start app\bin\i386\Rscript.exe source\application.R"

# Remove temp directory
RMDir /r "$INSTDIR\tmp"

SectionEnd