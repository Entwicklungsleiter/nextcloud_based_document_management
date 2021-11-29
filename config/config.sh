#!/bin/bash
#************************************************************************
# https://github.com/Entwicklungsleiter/who_needs_a_document_management *
# main configuration file          	                                    *
#************************************************************************

#*************
# configure: *
#*************

	PHOTO_FILES_TO_IMPORT="/home/eltern/Nextcloud/Share/Dokumente/Import/*.jpg"
	DOCUMENT_MANAGEMENT_TARGET_FOLDER="/home/eltern/Nextcloud/Share/Dokumente/"$(date +%Y)
	PHOTO_FILES_PROCESSED_SUCCESSFUL_TRASHBIN="/home/eltern/Nextcloud/Share/Dokumente/Done/"
	WORKDIR="/tmp/workdir"
