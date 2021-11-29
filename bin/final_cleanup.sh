#!/bin/bash
#************************************************************************
# https://github.com/Entwicklungsleiter/who_needs_a_document_management *
# cleaning up all temporary data and moving results to target folders   *			                    *
#************************************************************************

	mv *.pdf $DOCUMENT_MANAGEMENT_TARGET_FOLDER"/"
	rm -f *.min.jpg
	mv $PHOTO_FILES_TO_IMPORT $PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN
	rm -f *.txt 
	rm -rf $WORKDIR
