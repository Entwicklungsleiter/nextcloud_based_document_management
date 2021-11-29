#!/bin/bash

#*******************************************************************
# main bash script to run the process of importing document photos *
# into pdf files and make them searchable			               *
#*******************************************************************

	echo "nextcloud based document management system 0.1alpha"
	echo "https://github.com/Entwicklungsleiter/nextcloud_based_document_management"

#*************
# configure: *
#*************

	THIS_FILES_FULL_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
	source $THIS_FILES_FULL_PATH/config/config.sh

#***********************************
# check if required folders exist: *
#***********************************

	source $THIS_FILES_FULL_PATH/bin/check_dependencies.sh

#********************
# run main process: *
#********************

	source $THIS_FILES_FULL_PATH/bin/ocr_and_pdf_generation_process.sh

	source $THIS_FILES_FULL_PATH/bin/final_cleanup.sh

exit 0
