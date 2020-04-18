## Activity File: Restoring Data with Incremental Backups

- In this activity, you will continue as a junior administrator at *Rezifp Pharma Inc* where the E-Prescription Treatment database was attacked. Fortunately, the team had a recent full backup to recover the database.

- However, a pharmacy technician noticed that some files in the Patient database were missing and the team discovered that the wrong full backup was used. You extracted the files from the Patient directory in the correct archive and placed them in a directory for review.

- The pharmacy technician has reviewed and approved the files.  The head of the pharmacy technician department decides that these files can be placed in the Patient directory so another full backup restoration will not be needed.

- Your team performs hourly incremental backups of the E-Prescription Treatment system and will check this backup to ensure the files are added.

- You and your partner are learning about incremental backups, and your team lead asks you to practice restoring the incremental backup of the Patient files in a test environment. 

Your team must do the following in the test environment:

* Perform a level 0 backup of the E-Prescription Treatment directories. 

* List the contents of the level 0 backup.

* Copy the extracted missing files to the Patient directory and validate that the files are added.

* Perform an incremental backup using the current snapshot file.

* List the contents of the incremental backup to check that the missing files are present.

* Remove the missing files from the Patient directory.

* Restore the system from the incremental backups. 

* List the contents of the Patient directory to see that the deleted files were added by the incremental backup.

### Instructions

To start this activity, review what you've learned about *full* and *incremental backups* by working with your partner to answer the following questions:

1. Briefly describe the difference between a full and incremental backup.

2. If you have a backup schedule of Monday, Tuesday, Wednesday, Thursday and Friday:  

    - On what day would you schedule the level 0 backup to be done?

    - What order should the backups be applied to restore a system that was completely lost after an attack?

3. What command do you use to create a level 0 backup of `archive/home/user1`? 

4. How do you list the contents of an incremental backup?

5. After listing the contents of an incremental backup, what do the following letters indicate?

    * **`Y`** indicates that _______.

    * **`N`** indicates that _______.

    * **`D`** indicates that _______.

Now you will start the test of the incremental backup restoration.  

- If you are not already logged on, please log into the lab environment with:

   -  Username: `sysamin`  
    - Password: `cybersecurity`

1. Move into the `$HOME/testenvir` directory and list the contents.

2. In your `$HOME` directory, create the level 0 backup of the `testenvir` directory, which contains the `doctor`, `patient`, and `treatment` directories.

    * Name the level 0 backup: `epscript_back_sun.tar`

    * Name the snapshot file: `epscript_backup.snar`

    * Remember to include the `tar` option that will **validate the archive after writing it**.

    * Write and execute the command.

3. Write and execute the `tar` command to list the contents of the level 0 backup.

    * What is the status of the files in the backup?

4. Copy the missing Patient files from `$HOME/missingfiles/` to the `testenvir/patient/` directory.

    * What files have been added to the `testenvir/patient` directory?

5. Move to `$HOME` and create an incremental backup that will include the added files.

    * Name the incremental backup: `epscript_back_mon.tar` 

6. List the contents of the `epscript_back_mon.tar` incremental backup.

    * What is the status of the files in the incremental backup?

7. Remove the added files from the `testenvir/patient` directory.

8. Next, your team will *apply the incremental backup* to restore the system.

    * What backup should be applied to restore the deleted files?

9. Restore the deleted files.

    * Remember to use the `tar` option to print error messages with the block number in the archive file.

    * List the contents of the `patient` directory after restoration.

--- 
#### Copyright
© 2020 Trilogy Education Services, a 2U, Inc. brand.  All Rights Reserved.