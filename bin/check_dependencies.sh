#!/bin/bash
#************************************************************************
# https://github.com/Entwicklungsleiter/who_needs_a_document_management *
# checking for all folders required and                                 *
# external binaries being available			                            *
#************************************************************************

#***********************************
# check if required folders exist: *
#***********************************

	if [ ! -d $WORKDIR ]; then
		mkdir -p $WORKDIR
		echo "workdir folder "$WORKDIR" created" | tee --append $LOGFILE
	else
		echo "workdir folder "$WORKDIR" existed" | tee --append $LOGFILE
	fi
	
	cd $WORKDIR
	
	# prepare logfile
	LOGFILE=$WORKDIR"/import.log"
	if [ ! -f $LOGFILE ]; then
		touch $LOGFILE
		echo "logfile "$LOGFILE" created" | tee --append $LOGFILE
	else
		echo "logfile "$LOGFILE" existed" | tee --append $LOGFILE
	fi


	if [ ! -d $DOCUMENT_MANAGEMENT_TARGET_FOLDER ]; then
		mkdir -p $DOCUMENT_MANAGEMENT_TARGET_FOLDER
		echo "target folder "$DOCUMENT_MANAGEMENT_TARGET_FOLDER" created" | tee --append $LOGFILE
	else
		echo "target folder "$DOCUMENT_MANAGEMENT_TARGET_FOLDER" existed" | tee --append $LOGFILE
	fi

	if [ ! -d $PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN ]; then
		mkdir -p $PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN
		echo "folder for processed files "$PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN" created" | tee --append $LOGFILE
	else
		echo "folder for processed files "$PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN" existed" | tee --append $LOGFILE
	fi
