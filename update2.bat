@echo off
REM =====================================================
REM Implementation credit: iDkP from GaragePixel, 2025-06-19 (Aida 4)
REM Automated Monkey2 sorts import to GitHub w/ PRs
REM =====================================================

REM --------- CONFIG ---------
REM Local source files (update these as needed)
set "TIMSORT_SRC=Z:\$$5__MAD2nd\__MONKEY2\Monkey2-v2018.09b\modules\sorts\advanced\timsort.monkey2"
set "STOOGESORT_SRC=Z:\$$5__MAD2nd\__MONKEY2\Monkey2-v2018.09b\modules\sorts\educationals\stoogesort.monkey2"
set "COCKTAIL_SRC=Z:\$$5__MAD2nd\__MONKEY2\Monkey2-v2018.09b\modules\sorts\o2sorts\cocktailshakersort.monkey2"
set "COMBSORT_SRC=Z:\$$5__MAD2nd\__MONKEY2\Monkey2-v2018.09b\modules\sorts\o2sorts\combsort.monkey2"

REM Repo destination subfolders
set "TIMSORT_DST=advanced\timsort.monkey2"
set "STOOGESORT_DST=educationals\stoogesort.monkey2"
set "COCKTAIL_DST=o2sorts\cocktailshakersort.monkey2"
set "COMBSORT_DST=o2sorts\combsort.monkey2"

REM PR co-author line
set "COAUTHOR=Co-authored-by: blitz-research <marksibly@zohomail.com>"

REM --------- UNIQUE BRANCH SUFFIX (timestamp + random) ---------
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set "RAND=%RANDOM%%RANDOM%"
set "SUFFIX=%datetime%%RAND%"

REM --------- MAIN LOGIC ---------
call :push_pr "%TIMSORT_SRC%" "%TIMSORT_DST%" "add-timsort-%SUFFIX%" "Add timsort.monkey2 (ported from MAD2nd)"
call :push_pr "%STOOGESORT_SRC%" "%STOOGESORT_DST%" "add-stoogesort-%SUFFIX%" "Add stoogesort.monkey2 (ported from MAD2nd)"
call :push_pr "%COCKTAIL_SRC%" "%COCKTAIL_DST%" "add-cocktailshaker-%SUFFIX%" "Add cocktailshakersort.monkey2 (ported from MAD2nd)"
call :push_pr "%COMBSORT_SRC%" "%COMBSORT_DST%" "add-combsort-%SUFFIX%" "Add combsort.monkey2 (ported from MAD2nd)"
goto :eof

:push_pr
setlocal
set "SRC=%~1"
set "DST=%~2"
set "BRANCH=%~3"
set "MSG=%~4"
REM Checkout main, update
git checkout main
git pull
REM New feature branch
git checkout -b %BRANCH%
REM Ensure destination folder exists
for %%F in ("%DST%") do if not exist "%%~dpF" mkdir "%%~dpF"
REM Copy file
copy /Y "%SRC%" "%DST%"
if not exist "%DST%" (
	echo WARNING: File not copied: %SRC%
	git checkout main
	git branch -D %BRANCH%
	endlocal
	goto :eof
)
REM Commit and push
git add "%DST%"
git commit -m "%MSG%`n%COAUTHOR%"
git push -u origin %BRANCH%
REM Create PR
gh pr create --title "%MSG%" --body "%COAUTHOR%" --base main --head %BRANCH% --repo GaragePixel/sorts --fill
REM Get PR number for merge:
for /f "tokens=1" %%P in ('gh pr list --state open --head %BRANCH% --json number --jq ".[0].number"') do set PRNUM=%%P
if defined PRNUM (
	REM Merge and delete branch
	gh pr merge %PRNUM% --auto --delete-branch --repo GaragePixel/sorts
)
git checkout main
endlocal
goto :eof
