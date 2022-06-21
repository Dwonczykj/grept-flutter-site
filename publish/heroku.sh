#!/bin/zsh

source ~/.zshrc

# fluttervm build web

# Copy contents of build/web/ folder to publish/web/

cp -v -R ./build/web ./publish/web

# cd to git directory
# $CURRENT_DIR=pwd
# echo $CURRENT_DIR
cd ./publish/web
pwd | xargs echo

# git commit and push to heroku remote
echo "Git commit message:"
read MESSAGE
git add .
git commit -am $MESSAGE
git push heroku master

