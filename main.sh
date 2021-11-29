#!/bin/bash
#************************************************************************
# https://github.com/Entwicklungsleiter/who_needs_a_document_management *
# main bash script to run the process of importing document photos      *
# into pdf files and make them searchable			                    *
#************************************************************************

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

	if [ "0" == $(ls $PHOTO_FILES_TO_IMPORT 2> /dev/null | wc -l)  ]; then
		echo 
		echo "=> Error: Did not find files like "$PHOTO_FILES_TO_IMPORT" - Aborting process." | tee --append $LOGFILE
		source $THIS_FILES_FULL_PATH/bin/final_cleanup.sh
		exit 0
	fi

	source $THIS_FILES_FULL_PATH/bin/ocr_and_pdf_generation_process.sh

	source $THIS_FILES_FULL_PATH/bin/final_cleanup.sh

exit 0
