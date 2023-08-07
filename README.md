# Filelocker
this is a very simple and lite batch program that can lock or unlock a folder and encrypt user password with md5 encryption metod

## How to use
just put the "FileLocker.bat" file in any directory and run it once it will create a folder called "Locker",
put everything in that folder that you need to lock

#### locking
run again bat file insert 1234 (default password) then insert 1; the Locker folder will be disappear

#### unlocking
run again and enter password then insert 1; the folder will be appear again

### how to change password
run FileLocker.bat insert your new password and then insert 2 for program to hash it, copy your new hashed password
open your bat file with an editor paste your hashed password after "set password="; save the file and rerun it. your password will be changed.

(if you can't open the file with your editor rename it to "FileLocker.txt" apply your changes and again rename it to "FileLocker.bat"

### notice! this program does not have good protection!
This program is very simple and it will only hides your files from file explorer!
There are no security features in this program!
Please do not use this program for very sensitive and important purposes!
