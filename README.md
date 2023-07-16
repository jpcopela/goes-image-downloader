# goes-image-downloader
Bash script to download latest GOES-16/18 full disk images and use them for an animated GNOME wallpaper

![alt text](https://github.com/jackcop/goes-image-downloader/blob/main/goes-wallpaper.gif?raw=true)

This shell script downloads the latest false color full disk GOES-16 images from the URL https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/latest.jpg , resizes them to fit your screen, and makes them the background wallpaper so that you have an up-to-date image of the Earth for your background viewing pleasure!

Crontab is used to run the script every 10 minutes, and the following line should be added to your user Cron file by running the command:

`crontab -e`

and inserting:

`*/10 * * * * /bin/bash <path to the installed folder>/publish-images.sh > /tmp/cron.log`

You will also need to grant the `publish-images.sh` file execution permissions by running

`cd goes-image-downloader`

`chmod a+x publish-images.sh`

# Dependencies:
This script was written for use on Ubuntu 22.04 using GSettings and GNOME.
The only non-default dependencies are `wget` and `imagemagick` for downloading the images and resizing them, respectively. You may also need to install `dconf` for `gsettings` to work properly.

# Notes:
Because GNOME is weird and uses different background settings for the dark and light themes, this project assumes you are using the light theme. I will work on getting the dark theme working in the future.

You will need to change the paths to the folder where you install these files. I have them in a Projects folder under my user profile.

Also, it is a good idea to go into the shell script and change the resolution of the image to match the resolution of your screen. I am running this on a 2017 Macbook Air, so my screen resolution is 1440x900, but yours will likely be different.

