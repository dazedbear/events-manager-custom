#!/bin/bash
# zip 檔名
PATCH_NAME="event-manager-patch-$(date '+%Y-%m-%d-%H%M%S')"
# 對照 initial commit 後有更改的所有檔案
CHANGE_FILES_PATH=$(git diff --name-only d7e06f2)
echo "============ Generate Readme File ============"
mkdir ./build/$PATCH_NAME
touch ./build/$PATCH_NAME/README.txt
printf "請將檔案放到以下對應的路徑喔~\n.gitignore & build.sh 請忽略它 Thx!\n\n" >> ./build/$PATCH_NAME/README.txt
printf "[更新檔路徑] \n$CHANGE_FILES_PATH\n" >> ./build/$PATCH_NAME/README.txt

echo "[File Path] ./build/$PATCH_NAME/README.txt"
echo "============ Start Bundle ============"
cp -r $CHANGE_FILES_PATH ./build/$PATCH_NAME
cd ./build
zip -r ./$PATCH_NAME.zip ./$PATCH_NAME
echo "============ Bundle Success! ============"

