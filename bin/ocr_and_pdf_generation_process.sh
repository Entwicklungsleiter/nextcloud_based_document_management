#!/bin/bash
#************************************************************************
# https://github.com/Entwicklungsleiter/who_needs_a_document_management *
# generate PDF files and run OCR text process                           *
#************************************************************************

	echo
	echo "#############################"
	echo "Starting to run main process:" | tee --append $LOGFILE
	for ASOURCE in $PHOTO_FILES_TO_IMPORT ; do

		echo $ASOURCE $(basename $ASOURCE .jpg)
		
		convert $ASOURCE -resize 1280 $(basename $ASOURCE .jpg)".min.jpg"
		
		tesseract -l deu $(basename $ASOURCE .jpg)".min.jpg" $(basename $ASOURCE .jpg) pdf
		pdftotext $(basename $ASOURCE .jpg).pdf
	done
