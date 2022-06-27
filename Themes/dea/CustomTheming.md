 Open edX custom Theming

 
 1. Edit the LMS configuration file

        sudo nano /edx/etc/lms.yml

"""
Find the parameter, "PLATFORM_NAME: : Your Platform Name Here" 
located on or around row 465.
Replace the text "Your Platform Name Here" 
with a more appropriate name for your Open edX platform.
"""

2.  Reload the LMS configuration parameters.

        sudo /edx/app/edxapp/reload_lms_config.sh && sudo /edx/app/edxapp/reload_cms_config.sh

3. Check your work. Open the LMS in a browser window. 

        # In the footer of the landing page you should see the text, 
        # "© [YOUR NEW PLATFORM NAME]. All rights reserved except where noted. edX, Open edX and their respective logos are registered trademarks of edX Inc."


4. Compile assets manually
   To compile javascript and css outside of the update script run the following commands:

        sudo su edxapp -s /bin/bash
        cd /edx/app/edxapp/edx-platform && source /edx/app/edxapp/edxapp_env
        paver update_assets cms --settings=production
        paver update_assets lms --settings=production

        python manage.py cms --settings=production collectstatic --noinput #this is optional
        python manage.py lms --settings=production collectstatic --noinput #this is optional

        ##After compilation you get a success confirmation window for both lms and cms

        ##exit the environment
        exit

5. Restart services to pick up new changes

    /edx/bin/supervisorctl restart all && /edx/bin/supervisorctl restart edxapp_worker: