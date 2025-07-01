@echo off
REM Clone only the charts folder from stable branch with sparse checkout

REM Remove old temp folder if it exists
if exist temp-repo (
    rmdir /s /q temp-repo
)

REM Clone repo with no checkout, depth 1, stable branch
git clone --depth 1 --filter=blob:none --no-checkout --branch stable https://github.com/CAAPIM/apim-charts.git temp-repo

cd temp-repo

REM Initialize sparse checkout and set to charts folder
git sparse-checkout init --cone
git sparse-checkout set charts

REM Checkout the sparse files (will download only charts)
git checkout

cd ..

REM Create external/charts folder if missing
if not exist charts mkdir charts

REM Copy charts folder to external/charts
xcopy temp-repo\charts charts /e /i /y

REM Cleanup temp folder
rmdir /s /q temp-repo

echo Done fetching charts folder!
pause
