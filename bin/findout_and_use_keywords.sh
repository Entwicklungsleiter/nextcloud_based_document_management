#!/bin/bash

#******************************************************
# extract keywords from OCR result texts and          *
# use them to generate meaningful file names and tags *
#******************************************************

	echo
	echo "# runninig main process to find keywords #" | tee --append $LOGFILE

# docker exec -it --user www-data nextcloud-app php /var/www/html/occ tag:list
