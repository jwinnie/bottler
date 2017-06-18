#!/bin/bash

DIR=$1
VENV_NAME=venv

mkdir $DIR
cd $DIR

echo -e "\033[1;31m:=> 🔧  Setting up virtualenv...\033[0m"

virtualenv $VENV_NAME 
source $VENV_NAME/bin/activate

echo -e "\033[1;31m:=> 📦  Installing with pip...\033[0m"

pip install flask
pip install gunicorn
pip install honcho
pip install pymongo

echo -e "\033[1;31m:=> ⚙️  Finishing virtualenv setup...\033[0m"

pip freeze > requirements.txt
deactivate

echo -e "\033[1;31m:=> ✍️  Generating project...\033[0m"

echo "📂  Setting up directories..."
mkdir templates
mkdir static

echo "📄  Generating index.html..."

cat > templates/index.html << EOF

<!doctype html>

<html lang="en">
<head>
    <meta charset="utf-8">

    <title></title>
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="/static/index.css"></script>

    <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
    <h1>Hello, World!</h1>

    <script src="/static/index.js">
</body>
</html>

EOF

echo "📄  Generating index.py..."

cat > index.py << EOF

from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html")

EOF

echo "📄  Generating Procfile..."

cat > Procfile << EOF

web: gunicorn index:app

EOF

echo "📄  Generating website resources..."
touch static/index.css
touch static/index.js

echo -e "\033[1;31m:=> 🌱  Setting up git... \033[0m"

git init
git add -A
git commit -m "bottler: Created project"

echo -e "\033[1;31m:=> ✅  Finished setup \033[0m"
echo

exit
