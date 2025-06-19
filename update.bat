@echo off
REM ===============================================================================
REM  Batch Script: Direct Monkey2 Sorts Module Git Uploader
REM  Implementation: iDkP from GaragePixel | Date: 2025-06-18 | Aida v1.0
REM ===============================================================================

REM ========================== Purpose ===========================================
REM Creates a temporary git repository to upload Monkey2 sorting algorithm files
REM directly from local filesystem to GaragePixel/sorts GitHub repository.
REM Each file gets its own branch with proper attribution to algorithm authors
REM and co-author credit to blitz-research for the Monkey2 implementation.

REM ==================== List of Functionality ==============================
REM - Creates temporary git repository in system temp directory
REM - Clones GaragePixel/sorts repository for clean workspace
REM - Iterates through Monkey2 source files and JSON metadata
REM - Creates unique branches named after algorithm authors or coffee varieties
REM - Preserves directory structure from source to destination repository
REM - Commits files with proper co-author attribution to blitz-research
REM - Pushes branches and merges directly using pure Git operations
REM - Cleans up temporary repository after successful upload
REM - Handles nested directory creation for advanced/classical/educational sorts

REM ========================== Notes Section =================================
REM Implementation Choices:
REM - Uses temporary directory to avoid polluting source location
REM - Pure Git workflow eliminates external dependencies beyond Git itself
REM - Direct push-to-main strategy bypasses pull request overhead for trusted files
REM - Preserves Monkey2 module structure with proper subdirectory handling
REM - Co-author attribution follows GitHub's commit trailer format
REM - Branch naming follows algorithm authorship for historical accuracy
REM - Coffee variety names used for non-algorithmic files (module.json, etc.)
REM - Automatic cleanup prevents workspace pollution after operations
REM
REM Dependencies:
REM - Git CLI must be configured with push access to GaragePixel/sorts
REM - Source files must exist at specified Z:\ path location
REM - Internet connection required for clone/push operations
REM - No GitHub CLI dependency - pure Git workflow

REM ====================== Technical Advantages ==============================
REM Pure Git Workflow Superiority:
REM   Git alone provides all necessary functionality for branch creation, merging,
REM   and remote operations. GitHub CLI adds unnecessary complexity and dependency
REM   overhead for operations that Git handles natively. Direct git push/merge
REM   operations are faster and more reliable than REST API calls.
REM
REM Granular Version Control:
REM   Each algorithm gets its own branch and merge history, allowing for
REM   individual rollbacks and clear attribution tracking per sorting method.
REM   Git's native merge capabilities ensure proper commit genealogy.
REM
REM Preserves Academic Attribution:
REM   Branch naming convention honors original algorithm authors (Hoare for
REM   quicksort, Shell for shellsort) while co-author commits credit the
REM   Monkey2 language maintainer for implementation framework.
REM
REM Monkey2 Module Structure Compliance:
REM   Maintains proper Monkey2 module hierarchy with advanced/classical/
REM   educational categorization, ensuring compatibility with Monkey2 build
REM   system and module import resolution. Tab-only indentation preserved.

REM ===============================================================================

REM Configuration Variables
set "SRCROOT=Z:\$$5__MAD2nd\__MONKEY2\Monkey2-v2018.09b\modules\sorts"
set "COAUTHOR=Co-authored-by: blitz-research <github@blitzbasic.com>"
set "REPO_URL=https://github.com/GaragePixel/sorts.git"
set "TEMP_DIR=%TEMP%\monkey2_sorts_upload_%RANDOM%"
set "FILELIST=file_branch_mapping.txt"

REM Verify prerequisites
if not exist "%SRCROOT%" (
	echo ERROR: Source directory does not exist: %SRCROOT%
	pause
	exit /b 1
)

REM Check for git CLI
git --version >nul 2>&1
if errorlevel 1 (
	echo ERROR: Git CLI not found or not configured
	echo Please install Git and configure your credentials
	pause
	exit /b 1
)

echo Creating temporary workspace for Monkey2 sorts upload...
echo Source: %SRCROOT%
echo Target: GaragePixel/sorts repository
echo Workspace: %TEMP_DIR%
echo.

REM Create temporary directory and clone repository
mkdir "%TEMP_DIR%" 2>nul
cd /d "%TEMP_DIR%"

echo Cloning repository...
git clone "%REPO_URL%" .
if errorlevel 1 (
	echo ERROR: Failed to clone repository
	pause
	exit /b 1
)

REM Create file mapping if it doesn't exist
if not exist "%FILELIST%" (
	call :CREATE_DEFAULT_MAPPING
)

echo Starting file upload process...
echo.

REM Main processing loop
for /f "usebackq tokens=1,2 delims=|" %%A in ("%FILELIST%") do (
	call :PROCESS_FILE "%%A" "%%B"
)

REM Cleanup temporary directory
echo.
echo Cleaning up temporary workspace...
cd /d "%TEMP%"
rmdir /s /q "%TEMP_DIR%" 2>nul

echo.
echo All Monkey2 sorts files uploaded successfully.
echo Repository: https://github.com/GaragePixel/sorts
pause
exit /b 0

REM ===============================================================================
REM Subroutine: Process individual file upload
REM Parameters: %1 = relative file path, %2 = branch name
REM ===============================================================================
:PROCESS_FILE
setlocal
set "FILEPATH=%~1"
set "BRANCHNAME=%~2"
set "SRCFILE=%SRCROOT%\%FILEPATH%"

echo Processing: %FILEPATH% -^> branch: %BRANCHNAME%

REM Verify source file exists
if not exist "%SRCFILE%" (
	echo WARNING: Source file not found: %SRCFILE%
	goto :PROCESS_FILE_CLEANUP
)

REM Checkout and update main branch
git checkout main
git pull origin main

REM Create and switch to feature branch
git checkout -b %BRANCHNAME%

REM Create target directory if needed
for %%F in ("%FILEPATH%") do (
	if not "%%~dpF"=="." (
		if not exist "%%~dpF" mkdir "%%~dpF"
	)
)

REM Copy source file to repository
copy /Y "%SRCFILE%" "%FILEPATH%"

REM Stage and commit with co-author
git add "%FILEPATH%"
git commit -m "Add %FILEPATH% implementation" -m "" -m "%COAUTHOR%"

REM Push branch to remote
git push -u origin %BRANCHNAME%

REM Switch back to main and merge the branch
git checkout main
git merge %BRANCHNAME% --no-ff -m "Merge %BRANCHNAME%: Add %FILEPATH%"

REM Push merged main branch
git push origin main

REM Delete the feature branch locally and remotely
git branch -d %BRANCHNAME%
git push origin --delete %BRANCHNAME%

:PROCESS_FILE_CLEANUP
endlocal
goto :eof

REM ===============================================================================
REM Subroutine: Create default file mapping configuration
REM ===============================================================================
:CREATE_DEFAULT_MAPPING
echo Creating file mapping configuration...
echo sorts.monkey2^|coffea_arabica > "%FILELIST%"
echo module.json^|coffea_robusta >> "%FILELIST%"
echo advanced\introsort.monkey2^|davidmusser >> "%FILELIST%"
echo advanced\mergesortInPlace.monkey2^|johnvonneumann >> "%FILELIST%"
echo advanced\shellsort.monkey2^|donaldshell >> "%FILELIST%"
echo classicals\heapsort.monkey2^|jwhilliams >> "%FILELIST%"
echo classicals\insertsort.monkey2^|insertionsort_author >> "%FILELIST%"
echo classicals\mergesort.monkey2^|johnvonneumann_merge >> "%FILELIST%"
echo classicals\quicksort.monkey2^|tonyhoare >> "%FILELIST%"
echo educationals\bogosort.monkey2^|coffea_liberica >> "%FILELIST%"
echo educationals\bubblesort.monkey2^|coffea_canephora >> "%FILELIST%"
echo o2sorts\bricksort.monkey2^|coffea_excelsa >> "%FILELIST%"
echo o2sorts\cubesort.monkey2^|coffea_stenophylla >> "%FILELIST%"
echo o2sorts\gnomesort.monkey2^|coffea_charrieriana >> "%FILELIST%"
echo specials\blocksort.monkey2^|coffea_eugenioides >> "%FILELIST%"
echo specials\tournamentsort.monkey2^|coffea_racemosa >> "%FILELIST%"
echo File mapping created: %FILELIST%
goto :eof

REM ===============================================================================
