#!/bin/bash

#**********************************************
# generate PDF files and run OCR text process *
#**********************************************

	echo
	echo "# runninig main process of OCR and PDF generation #" | tee --append $LOGFILE

	if [ "0" == $(ls $PHOTO_FILES_TO_IMPORT 2> /dev/null | wc -l)  ]; then
		echo "=> Error: Did not find files like "$PHOTO_FILES_TO_IMPORT" - Aborting process." | tee --append $LOGFILE
		source $THIS_FILES_FULL_PATH/bin/final_cleanup.sh
		exit 0
	fi

	for ASOURCE in $PHOTO_FILES_TO_IMPORT ; do

		echo $ASOURCE $(basename $ASOURCE .jpg)

		convert $ASOURCE -resize 1280 $(basename $ASOURCE .jpg)".min.jpg"

		tesseract -l deu $(basename $ASOURCE .jpg)".min.jpg" $(basename $ASOURCE .jpg) pdf
		pdftotext $(basename $ASOURCE .jpg).pdf
	done
