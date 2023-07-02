#!/bin/bash

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

#if network connectivity is full, perform all comands, else, don't.
if [ $(nmcli networking connectivity) = 'full' ];

then
	echo "Updating Earthview..."

	#rename old image and update background path
	mv /home/jackson/Projects/goes-image-downloader/latest.jpg /home/jackson/Projects/goes-image-downloader/former.jpg

	gsettings set org.gnome.desktop.background picture-uri file:////home/jackson/Projects/goes-image-downloader/former.jpg

	#download image from https://www.star.nesdis.noaa.gov/GOES/fulldisk_band.php?sat=G16&band=GEOCOLOR&length=12
	wget -nd -A.jpg https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/latest.jpg -O /home/jackson/Projects/goes-image-downloader/latest_unformatted.jpg

	#resize new image
	convert /home/jackson/Projects/goes-image-downloader/latest_unformatted.jpg -resize 1920x1080 -background black -gravity center -extent 1920x1080 /home/jackson/Projects/goes-image-downloader/latest.jpg

	#delete unformatted image
	rm /home/jackson/Projects/goes-image-downloader/latest_unformatted.jpg

	#set new image as background
	gsettings set org.gnome.desktop.background picture-uri file:////home/jackson/Projects/goes-image-downloader/latest.jpg

	#delete former image
	rm /home/jackson/Projects/goes-image-downloader/former.jpg

else
	echo "No internet connection..."
fi
