#!/bin/bash

#**********************************************************************
# cleaning up all temporary data and moving results to target folders *			                    *
#**********************************************************************

	echo
	echo "# runninig post-process to cleanup temp results and data #" | tee --append $LOGFILE

	if [ "0" != $(ls $WORKDIR/*.pdf 2> /dev/null | wc -l)  ]; then
		echo "moving result PDF files from working directory "$WORKDIR" to "$DOCUMENT_MANAGEMENT_TARGET_FOLDER
		mv $WORKDIR/*.pdf $DOCUMENT_MANAGEMENT_TARGET_FOLDER"/"
	fi

	if [ "0" != $(ls $WORKDIR/*.pdf 2> /dev/null | wc -l)  ]; then
		echo "deleting minimized document photos in working directory "$WORKDIR
		rm -f $WORKDIR/*.min.jpg
	fi

	if [ "0" != $(ls $PHOTO_FILES_TO_IMPORT 2> /dev/null | wc -l)  ]; then
		echo "moving successful processed image files from working directory "$WORKDIR" to "$PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN
		mv $PHOTO_FILES_TO_IMPORT $PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN
	fi

	if [ "0" != $(ls $WORKDIR/*.txt 2> /dev/null | wc -l)  ]; then
		echo "deleting text files in working directory "$WORKDIR
		rm -f $WORKDIR/*.txt
	fi

	if [ -d $WORKDIR ]; then
		echo "deleting working directory "$WORKDIR
		rm -rf $WORKDIR
	fi
