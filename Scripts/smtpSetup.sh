#!/bin/bash

echo -e "\e[33mDisabling Tutor's smtp server\e[0m"
tutor config save --set RUN_SMTP=false

echo "Configuring your smtp server.Please wait..."
echo ""
tutor config save \
  --set SMTP_HOST=smtp.gmail.com \
  --set SMTP_PORT=587 \
  --set SMTP_USE_SSL=false  \
  --set SMTP_USE_TLS=true \
  --set SMTP_USERNAME=YOUREMAIL@gmail.com \  # remember to change this to use the account that you generated the app password in
  --set SMTP_PASSWORD='app-specific-password'  # to generate one go to https://myaccount.google.com/
echo "Done smtp configuration."

echo ""
echo "Recompiling the application to use the new mailing server."
echo ""
echo -e "\e[33mPS: Press enter and y for the prompts by this process. Most required infomation is for the build which you had configured during deployment\e[0m"

tutor local quickstart
echo "Done setting up SMTP server for mailing service"
echo ""

echo "Testing smtp server.."

tutor local run --no-deps lms ./manage.py lms shell -c \
    "from django.core.mail import send_mail; send_mail('test subject', 'test message', 'YOUREMAIL@gmail.com', ['YOURRECIPIENT@domain.com'])"    # Please remember to provide the email from and email to 

  echo "SMTP server setup done successfully"
  exit 1