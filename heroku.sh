#!/bin/bash

heroku login

echo -e "\033[1;31m:=> ☁️  Creating Heroku app...\033[0m"

heroku create

echo -e "\033[1;31m:=> ⬆️  Deploying code...\033[0m"

git push heroku master

echo -e "\033[1;31m:=> 🔥  Activating app...\033[0m"

heroku ps:scale web=1

APP_URL=$(heroku apps:info -s  | grep web_url | cut -d= -f2)
echo -e "\033[1;31m-------------"
echo "App has been successfully deployed at:"
echo "${APP_URL}"
echo -e "To update the website:\033[0m"
echo -e "\033[1m$ git push heroku master\033[0m"
echo
