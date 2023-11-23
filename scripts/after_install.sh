#!/bin/bash

cd   /home/ubuntu/ssgbay

echo ">>> pip install ----------------------"
pip install -r requirements.txt

RUN crontab -l | { cat; echo "* * * * * /usr/local/bin/python /app/historyUpdate.py >> /var/log/cron.log 2>&1"; } | crontab -

echo ">>> npm install ----------------------"
npm install
npm run build

echo ">>> remove template files ------------"
rm -rf appspec.yml requirements.txt

echo ">>> change owner to ubuntu -----------"
chown -R ubuntu /home/ubuntu/ssgbay
# echo ">>> run app --------------------------"
# python3 -u app.py > /dev/null 2> /dev/null < /dev/null &