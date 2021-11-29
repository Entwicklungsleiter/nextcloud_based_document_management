#!/bin/bash
#************************************************************************
# https://github.com/Entwicklungsleiter/who_needs_a_document_management *
# main bash script to run the process of importing document photos      *
# into pdf files and make them searchable			                    *
#************************************************************************

#*************
# configure: *
#*************

	DATENQUELLE="/home/eltern/Nextcloud/Share/Dokumente/Import/*.jpg"
	DATENZIEL="/home/eltern/Nextcloud/Share/Dokumente/"$(date +%Y)
	MUELLEIMER="/home/eltern/Nextcloud/Share/Dokumente/Done/"
	WORKDIR="/tmp/workdir"


#******************
# prepare logfile *
#******************

	LOGFILE=$WORKDIR"/.backup_encrypted.log"
	touch $LOGFILE
	echo | tee --append $LOGFILE
	
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

	if [ ! -d $DATENZIEL ]; then
		mkdir -p $DATENZIEL
		echo "target folder "$DATENZIEL" created" | tee --append $LOGFILE
	else
		echo "target folder "$DATENZIEL" existed" | tee --append $LOGFILE
	fi

	if [ ! -d $MUELLEIMER ]; then
		mkdir -p $MUELLEIMER
		echo "folder for processed files "$MUELLEIMER" created" | tee --append $LOGFILE
	else
		echo "folder for processed files "$MUELLEIMER" existed" | tee --append $LOGFILE
	fi

#********************
# run main process: *
#********************

	echo "#############################"
	echo "Starting to run main process:" | tee --append $LOGFILE
	for ASOURCE in $DATENQUELLE ; do

		echo $ASOURCE $(basename $ASOURCE .jpg)
		
		convert $ASOURCE -resize 1280 $(basename $ASOURCE .jpg)".min.jpg"
		
		tesseract -l deu $(basename $ASOURCE .jpg)".min.jpg" $(basename $ASOURCE .jpg) pdf
		pdftotext $(basename $ASOURCE .jpg).pdf
	done
	
	mv *.pdf $DATENZIEL"/"
	rm -f *.min.jpg
	mv $DATENQUELLE $MUELLEIMER
	rm -f *.txt $WORKDIR

exit 0
