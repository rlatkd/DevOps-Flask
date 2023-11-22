#!/bin/bash

cd   /home/ubuntu/ssgbay

sudo apt-get install python3-pip

echo ">>> pip install ----------------------"
pip install -r requirements.txt

echo ">>> npm install ----------------------"
npm install
npm run build

echo ">>> remove template files ------------"
rm -rf appspec.yml requirements.txt

echo ">>> change owner to ubuntu -----------"
chown -R ubuntu /home/ubuntu/ssgbay
# echo ">>> run app --------------------------"
# python3 -u app.py > /dev/null 2> /dev/null < /dev/null &