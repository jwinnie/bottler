#!/bin/bash

VENV_NAME=venv

echo -e "\033[1;31m:=> ⚙️  Entering virtualenv...\033[0m"
source $VENV_NAME/bin/activate

echo -e "\033[1;31m:=> 🔨  Running...\033[0m"
honcho start

echo -e "\033[1;31m:=> ✅  Exiting...\033[0m"
deactivate
