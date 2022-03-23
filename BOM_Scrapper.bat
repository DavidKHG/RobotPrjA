@echo off


git clone https://github.com/DavidKHG/RobotHarness

mkdir BOM
cd RobotHarness
git fetch

for /f "delims=" %%i in (..\BOM_LIST.csv) do (

git checkout -t origin/%%i

copy %%i.txt ..\BOM\

echo %%i >> ..\BOM\Log.csv


git --no-pager log --pretty=format:"%s" -1 >> ..\BOM\Log.csv

echo. >> ..\BOM\Log.csv

)

cd ..

rmdir /S RobotHarness /Q
