#!/bin/zsh

source ~/.zshrc

echo "Git commit message:"
read MESSAGE

fluttervm build web

# Copy contents of build/web/ folder to publish/web/
find ../publish-grept-site/web -not -path "../publish-grept-site/web/.git/*" -type f -exec rm -f {} \;
cp -v -R ./build/web ../publish-grept-site
cp -v -R ./assets/* ../publish-grept-site/web/assets
cp -v ./assets/favicon.ico ../publish-grept-site/web/

# cd to git directory
# $CURRENT_DIR=pwd
# echo $CURRENT_DIR
cd ../publish-grept-site/web
pwd | xargs echo

# Add php bridge files:
cat >index.php <<END_FILE
<?php include_once("index.html"); ?>
END_FILE

cat >composer.json <<END_FILE
{}
END_FILE



# # git commit and push to heroku remote
git add .
git commit -am $MESSAGE
git push heroku main

