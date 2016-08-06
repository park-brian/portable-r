
#### Macros ####

## Append line to end of file
!macro AppendLine File String
  FileOpen $4 "${File}" a
  FileSeek $4 0 END
  FileWrite $4 "$\r$\n"
  FileWrite $4 "${String}"
  FileWrite $4 "$\r$\n"
  FileClose $4
!macroend

#### End Macros ####


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

# Require 168.9 Mb
AddSize 172974

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

# Remove temp directory
RMDir /r "$INSTDIR\tmp"

# Set defaults for R - portable library path/default repository
!insertmacro AppendLine "$INSTDIR\app\etc\RProfile.site" ".First <- function() .libPaths(.Library)"
!insertmacro AppendLine "$INSTDIR\app\etc\RProfile.site" "local({r <- getOption('repos'); r['CRAN'] <- 'http://cran.rstudio.com'; options(repos = r)})"

# Copy Files
setOutPath "$INSTDIR\source"
file "resources\application.R"

# Create application shortcut
setOutPath "$INSTDIR"
CreateShortCut "$INSTDIR\application.lnk" "$SYSDIR\cmd.exe" "/c start app\bin\Rscript.exe source\application.R"

SectionEnd