This is a proof of concept created when the question was posed in ##osx-server on Freenode.  I have not used this in production but in testing it worked.

Use the following to create a LaunchDaemon using the StartOnMount key to run a script every time a filesystem is mounted. 

Granted if there is a lot of activity with server mounts, allowed externals, etc, it would fire off the script every time.  

However, the script could be as simple as iterating thru a set # of disks (10 would probably be safe) using 'diskutil info /dev/disk# | grep -w SDXC | wc -l'.  

If the SD card reader is being used diskutil can show "Device / Media Name:      Apple SDXC Reader Media".  
wc will count the returned lines and return the value of 1.  If not, it returns 0. 
Use that with an if/then statement to umount.  I did POC testing on the below and it seems to work.  
The umounting is nearly instant.  You may want to be nicer about force unmounting, etc.


