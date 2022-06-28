#!/bin/bash

echo "Disabling Tutor's smtp server"
tutor config save --set RUN_SMTP=false

echo "Configuring your smtp server...Please wait"
echo ""


tutor config save \
  --set SMTP_HOST=smtp.gmail.com \
  --set SMTP_PORT=587 \
  --set SMTP_USE_SSL=false  \
  --set SMTP_USE_TLS=true \
  --set SMTP_USERNAME=paynelmfaonunt@gmail.com \
  --set SMTP_PASSWORD='Payne941213!'

  echo "Done smtp configuration"

  tutor local restart