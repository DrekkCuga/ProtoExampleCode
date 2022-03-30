# ProtoExampleCode

Extra disclamer:
This readme needs work, I just stole the one from the first scripts I wrote


DISCLAIMER: 
I made these scripts to provide a starting point for people wanting to use a raspberry pi to run their protogen head, however I can't make something that'll work for everyone.
This works on my setup (pi 4b and the adafruit bonnet), but your mileage may vary.
I WON'T be providing support for this unless there is something wrong with the code itself, however I won't be helping unless you can show you've already tried to solve the problem yourself.

This script has been developed on a raspberry pi 4, however it may work on older boards (with limited success).
This has been built around the adafruit hub75 bonnet: https://www.adafruit.com/product/3211, however should work with other wiring methods for the pi (I ain't helping with that though)
This guide assumes you already have terminal access to your pi. If you don't then sparkfun has a nice guide (You will proablly want the "WiFi with DHCP section) at: https://learn.sparkfun.com/tutorials/headless-raspberry-pi-setup/all#wifi-with-dhcp

Getting the files across to the pi with SFTP:
  Previously, you would need a third-party tool such as filezilla to copy files across, however windows now includes a SFTP client that we can use to transfer the files over the SSH connection we already have working.
  Once you have downloaded the setup.sh file, shift+right click in the folder (you can't have a file selected) and click "Open PowerShell window here"
  Once you have the powershell terminal open, type "sftp pi@<IP>" and hit enter (where <IP> is the IP address of your pi)
  It may show a warning about the fingerprint of the host, just type "yes" and hit enter
  Type in your password ("raspberry" if you haven't changed it) and hit enter, you won't get any visual feedback that your password is being recieved, but just type it and press enter.
  If you have connected correctly, you will be at a prompt with "stfp>" at the start of the line. If not, try connecting again.
  Once you are connected, type "put setup.sh" to copy the file across to the default directory in the pi (/home/pi by default)
  Type "exit" to close the connection, you can now close the PowerShell window

Running the setup script:
  Now we have the script copied across to the pi, we can now run the setup script to configure everything.
  Open a SSH terminal
  Type "ls", hit enter and check that the "setup.sh" file we copied earlier shows up, if not go back and copy it across.
  Type "sudo bash setup.sh" and hit enter, follow the on-screen instructions.
  When the full setup script starts running, if you haven't modified your adafruit hat, you will want to use the "Convenience" setting when it asks.
  Make sure you reboot when the installer is done, if it doesn't do it for you.

Running the face:
  To test the face, open up a SSH terminal and type "sudo python3 owo-pi.py", hit enter.
  This should bring up the face on your screens, if not you may have a wiring issue somewhere.

Debugging:
  If the face does not display correctly, you may need to change the "options.gpio_slowdown" setting on line 70 of the python file to 4 rather than 2.
  If the face is inverted, try playing around with the mirroring code on lines 57 and 58

Changing the face:
  The face is broken up into halves, so you can animate the eyes and the face seperately.
  The arrays are on lines 14 and 17.
  The face was exported from LEDMatrixStudio, each array is 16x64
  You can export your own face with the following settings:
    "Each Line of Output": "Frame"
	"Export Format": "Python (2 dimensional)"
	
  Note that you can't directly copy the code from the export, as there is a slight error in LEDMatrixStudio
  The exported code starts with "ledarray[][] = ", however python doesn't use that syntax.
  Simply remove the square brackets at the start so it looks like this: "ledarray = "
  Or just copy the stuff between the top and bottom square brackets

Animations:
  The "owo-pi-anim.py" file has an example of a timed blink animation, that can be modified to have different timing or animating the mouth as well
  The example uses a 5-7 second timer between blinks
  The animation code is a hot mess, but it allows the animations to run without blocking the code, so you can run as many animations as you want or have other stuff going on at the same time.
