#!/bin/bash


echo "Uninstalling tutor and related items"

tutor local dc down --remove-orphans
tutor dev dc down --remove-orphans

sudo rm -rf "$(tutor config printroot)"
sudo rm /usr/local/bin/tutor

pip uninstall tutor && pip uninstall tutor-android && pip uninstall tutor-discovery && pip uninstall tutor-ecommerce && pip uninstall tutor-forum && pip uninstall tutor-license && pip uninstall tutor-mfe &&  pip uninstall tutor-minio &&  pip uninstall tutor-notes &&  pip uninstall tutor-richie &&  pip uninstall tutor-webui &&  pip uninstall tutor-xqueue

