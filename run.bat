@echo off
setlocal
:: Change these variables to your desired "fake" values
set FAKE_NAME=Keendevmaster
set FAKE_EMAIL=duqueos2017@gmail.com
:: Make sure you're in the Git repository's directory or set it here
cd /d "G:\projects\mern\mernProjectEcommerce"
echo Rewriting commit history to change author information...
:: Use git filter-branch to change the author name and email
git filter-branch --env-filter "GIT_COMMITTER_NAME='%FAKE_NAME%'; GIT_COMMITTER_EMAIL='%FAKE_EMAIL%'; GIT_AUTHOR_NAME='%FAKE_NAME%'; GIT_AUTHOR_EMAIL='%FAKE_EMAIL%';" -- --all
:: Clean up old backup refs created by filter-branch
rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now --aggressive
echo Commit author information has been changed.
pause
endlocal