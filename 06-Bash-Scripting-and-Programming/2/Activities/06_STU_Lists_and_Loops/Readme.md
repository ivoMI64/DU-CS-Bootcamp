## Activity File: Lists and Loops

In the previous activity we added a few variables to our script along with a few `if` statements that check for various conditions.

Next we will start using loops to automate repetitive tasks in your script.

Loops are a staple of many scripts and you can use them to do any repetitive task that you would otherwise have to do manually, or by copying and pasting the same line of code over and over.

This will add another layer of sophistication and efficiency to your script.

To complete this activity, you will create several `for` loops that satisfy given requirements. If you get to the bonus, you can incorporate a `for` loop into your script.

### Create your script file.

1. Create a new file named `for_loops.sh` and open it in your text editor.

2. Add the required `boiler plate` line at the top so your computer knows it's a bash script.

### Create your variables

1. Create a variable that holds a list of numbers from `0-9`.

2. Create another variable that holds a list of 5 of your favorite U.S. states (e.g. Nebraska, Hawaii, California, etc.)

3. Create another variable that holds the output of the command `ls`.

### Create your `for` loops

1. Create a `for` loop that prints out only the numbers 3, 5 and 7 from your list of numbers.

2. Create a `for` loop that checks for the state 'New York' in your list of states. If the 'New York' is there, print "New York is the best!". If is not there, print "I'm not fond of New York".

3. Create a `for` loop that prints out each item in your variable that holds the output of the `ls` command.

### Bonus

1. During the last exercise, you created a variable that holds the command `find / -type f -perm /4000 2> /dev/null` and then you used `echo` to print out your variable later in the script.

You may have noticed that this produces an output that is a bit jumbled together:

```bash
SUID Files:
/usr/lib/openssh/ssh-keysign /usr/lib/eject/dmcrypt-get-device /usr/lib/dbus-1.0/dbus-daemon-launch-helper /usr/lib/qubes/qfile-unpacker /usr/lib/xorg/Xorg.wrap /usr/lib/policykit-1/polkit-agent-helper-1 /usr/sbin/pppd /usr/sbin/exim4 /usr/bin/newgrp /usr/bin/chsh /usr/bin/pkexec /usr/bin/gpasswd /usr/bin/chfn /usr/bin/passwd /usr/bin/sudo /sbin/pam-tmpdir-helper /opt/brave.com/brave/brave-sandbox /bin/ntfs-3g /bin/su /bin/umount /bin/fusermount /bin/mount /bin/ping
```

#### Challenge

Instead of using `echo` to print out this variable, use a `for` loop to print out each file on it's own line.
