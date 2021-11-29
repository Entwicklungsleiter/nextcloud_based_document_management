# a nextcloud based document management
_a list of bash scripts to stop wasting my life time with manual document management_

Why?
---------

 - You are searching for an efficient way to manage the wave of documents flooding Your mailbox and email inbox?
 - You don't want to strip all Your privacy and handover these documents to companies who provide payed document management services?
 - You are sick of wasting time searching for a bill, contract or document Your postbox was annoyed with in 2009?

That's why I am here.

I am a developer who wants to solve exactly this problem.

How?
---------

I believe in private cloud services (like [Nextcloud](https://nextcloud.com/)). Creating a virtual webspace, registering a cheap private domain and starting [the cloud software docker container](https://hub.docker.com/_/nextcloud) has never been [easier](https://blog.ssdnodes.com/blog/installing-nextcloud-docker/) [easier](https://blog.admin-intelligence.de/nextcloud-als-docker-container/) [easier](https://github.com/nextcloud/docker).

What private cloud software (currently) still misses, are all these document management functionalities:

 - optimize a documents photo and make it being used like a "scan"   
=> taking a photo should be effort enough
 - read the photos content (OCR) to make the document searchable  
=> file tagging, meaningful file names and folder structure
 - archive these documents in a way that's easy to handle  
=> replace closed document management systems with nothing but a clear and searchable file and folder structure
 - make all this shit run automatically to stop wasting my lifetime

How far did this project come?
--------------------------------

The existing bunch of scripts can run on a Linux based PC (I run Ubuntu) using

 - tesseract OCR software and
 - imagemagick image manipulation software.

The state so far:

 - does not (and is not planned to) interact with a scanner or scanning software, but wants the user to just take a photo with a modern mobile device and sync it to the folder structure of this system (by using a private cloud service like Nextcloud).
 - does still not optimize images clever, but requires a good taken photo of a mobile device. Until this feature is ready I recommend modern mobile devices having a "scan" function in devices camera app.
 - automatically runs image resizing to minimize size of the result PDF file.
 - automatically runs OCR software _tesseract_ to create PDF files with overlay text areas to make the PDF content searchable.
 - does still not identify key words to optimize PDF file searchability with tags and optimized file names.
 - does still not interact with any cloud service (but runs in my local installation inside the folder structure synchronized by Nextcloud).

