#!/bin/bash
#************************************************************************
# https://github.com/Entwicklungsleiter/who_needs_a_document_management *
# checking for all folders required and                                 *
# external binaries being available			                            *
#************************************************************************

#***********************************
# check if required folders exist: *
#***********************************

	# build a temporary working directory
	if [ ! -d $WORKDIR ]; then
		mkdir -p $WORKDIR
		echo "workdir folder "$WORKDIR" created" | tee --append $LOGFILE
	else
		echo "workdir folder "$WORKDIR" existed" | tee --append $LOGFILE
	fi
	
	# go there
	cd $WORKDIR
	
	# prepare logfile
	LOGFILE=$WORKDIR"/import.log"
	if [ ! -f $LOGFILE ]; then
		touch $LOGFILE
		echo "logfile "$LOGFILE" created" | tee --append $LOGFILE
	else
		echo "logfile "$LOGFILE" existed" | tee --append $LOGFILE
	fi

	# create folder for finished PDF files
	if [ ! -d $DOCUMENT_MANAGEMENT_TARGET_FOLDER ]; then
		mkdir -p $DOCUMENT_MANAGEMENT_TARGET_FOLDER
		echo "target folder "$DOCUMENT_MANAGEMENT_TARGET_FOLDER" created" | tee --append $LOGFILE
	else
		echo "target folder "$DOCUMENT_MANAGEMENT_TARGET_FOLDER" existed" | tee --append $LOGFILE
	fi

	# create a folder to move processed documtent photo files to
	if [ ! -d $PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN ]; then
		mkdir -p $PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN
		echo "folder for processed files "$PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN" created" | tee --append $LOGFILE
	else
		echo "folder for processed files "$PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN" existed" | tee --append $LOGFILE
	fi

	# check if required binaries (programs) are available
	if ! command -v tesseract &> /dev/null
	then
		echo "Error: ORC software \"tesseract\" could not be found! Please run \"sudo apt install tesseract-ocr tesseract-ocr-deu\""
		exit 1
	fi

	if ! command -v convert &> /dev/null
	then
		echo "Error: Image manipulation software \"convert\" could not be found! Please run \"sudo apt install imagemagick\""
		exit 1
	fi
