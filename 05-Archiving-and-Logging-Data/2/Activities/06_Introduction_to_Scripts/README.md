## Activity File: Introduction to Scripting

In this activity, you are a junior administrator at Rezifp Pharma Inc. 

- It is your responsibility to ensure the security of the organization’s network by automating many tasks, such as moving files, e.g., patient data, from various directories and locations using `cron`. 

- You accomplish many of these tasks through automation, using scripts written to run at regular intervals and/or periodically as determined by your department. 

- In response to malware, adware, and virus attacks, your organization has asked you to ensure proper configuration management of all networking equipment and associated systems. 

- Portions of the Health and Portability Act (HIPAA), require organizations to maintain a regular backup regimen for the safe and secure storage of patient data. In response to HIPAA regulations, your organization also ensures that any unused, temporary, and cached files are removed regularly.


You have been tasked to:

* Create a script, `backup.sh`, that compresses backups of the system's `/home` directory.

* Create a script, `update.sh`, that upgrades packages to their most recent version, keeping the system up-to-date.

* Create a script, `cleanup.sh`, that removes any unused, temporary, and cached files.

* Test the scripts by running them with bash, using the `./<name of the script>.sh` command.


### Instructions


1. Begin by creating a directory to hold your scripts in `~/Security_scripts`. Then move into this directory.

2. Create a file called `backup.sh`. Write a script that does the following:
    - Moves the file `/var/backups/home.tar.gz` to `/var/backups/home.last.tar.gz`. This allows you to save both the last backup you made, and the one you'll make now.

    - Creates a gzip-compressed archive of `/home`. Save this to `/var/backups/home.tar.gz`.
    - Lists all files in `/var/backups`, including file sizes, and saves the output to `/var/backups/file_report.txt`.
    - Prints how much memory your machine has free. Save this to a file called `/var/backups/disk_report.txt`.
    
    **Hint**: `free -h` prints free memory. `ls -lh` produces a long listing, including human-readable file sizes.

3. Create a file called `update.sh`. Write a script that does the following:
  
    - Updates `apt`.

    - Runs the command to upgrade all installed packages.
    - Runs the command to install new packages and upgrade the system.
    - Runs the command to remove unnecessary packages and their associated configurations.
    - **Bonus:** Add a line to the bottom of `update.sh` combining all of the commands with a single line of code.


4. Create a file called `cleanup.sh`. Write a script that does the following:
 
    - Removes all files in `/tmp` and `/var/tmp`.

    - Clears the `apt` cache.

    - Cleans the `thumbnails` cache.

    
5. Make all three scripts executable.


6. Test the scripts by running them with bash using the `./name.sh` command.

   **Note**: When testing `backup.sh`, stop the script with `Ctrl + C`. It will take a long time to create a full backup of `/home`, and we just want to see that it successfully runs.
  


