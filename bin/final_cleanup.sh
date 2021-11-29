#!/bin/bash
#************************************************************************
# https://github.com/Entwicklungsleiter/who_needs_a_document_management *
# cleaning up all temporary data and moving results to target folders   *			                    *
#************************************************************************

	if [ "0" != $(ls $WORKDIR/*.pdf 2> /dev/null | wc -l)  ]; then
		mv $WORKDIR/*.pdf $DOCUMENT_MANAGEMENT_TARGET_FOLDER"/"
	fi

	if [ "0" != $(ls $WORKDIR/*.pdf 2> /dev/null | wc -l)  ]; then
		rm -f $WORKDIR/*.min.jpg
	fi

	if [ "0" != $(ls $PHOTO_FILES_TO_IMPORT 2> /dev/null | wc -l)  ]; then
		mv $PHOTO_FILES_TO_IMPORT $PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN
	fi

	if [ "0" != $(ls $WORKDIR/*.txt 2> /dev/null | wc -l)  ]; then
		rm -f $WORKDIR/*.txt
	fi

	if [ -d $WORKDIR ]; then
		rm -rf $WORKDIR
	fi
