## Archiving and Logging Data Homework: Archiving and Logging Data
 
This units homework is designed to solidify the concepts and tools that we covered throughout the week's taught throughout class:

- Creating `tar` archives and compressing backups using `gzip`, and `bzip2`.
- Task automation using `cron`
- Basic Bash scripting.
- Log filtering using `journalctl`
- Priority-based log filtering and log file creation using `rsyslog`
- Log rotation using `logrotate` to manage log file sizes
- Perform log audits using `auditd` to check for policy and file abuse

For this assignment, you will continue to research and learn about these concepts to:

- Extract individual files with tar's `--strip-components` command option.
- Create `tar` archive excluding a directory with tar's `--exclude=` command option.
- Manage and backups using `cron` jobs.
- Write Bash scripts to create system resource usage reports.
- Perform log filtering using `journalctl`.
- Perform priority based log filtering and log file creation using `rsyslog`.
- Manage log file sizes using `logrotate`.
- Create an auditing system to check for Policy and file violations using `auditd`.

 Use your **Google** and **MAN PAGES** to help you through these exercises.
 
### Setup: Create `Projects` Directory

Additionally you will need to create a directory named "Projects" in your `/home/sysadmin/` directory. Download the following tar file using your Firefox browser in your Ubuntu machine, then move the tar file to your Projects directory before you get started:
- [TarDocs.tar](https://drive.google.com/a/2tor.com/file/d/1fRjFS1vOdS7yfKJgpJxR02_UxeT_qI_u/view?usp=sharing)


### Instructions

For this assignment, you will assume the role of a Security Analyst for Credico Inc., a financial institution that offers checking, savings, home & auto loans, and investment banking services. 

- The company collects, process, and maintains a large database of private financial information for both consumer and business accounts. 

- These files are maintained on a local server and fall under The Federal Trade Commission's regulation, Gramm-Leach-Bliley Act [(GLBA)](https://www.ftc.gov/tips-advice/business-center/privacy-and-security/gramm-leach-bliley-act).

In an effort to mitigate network attacks and meet Federal regulatory compliance, Credico Inc developed an efficient log management program that performs: 
- Priority-based logging with rsyslog,  
- Log size management using Logrotate, and 
- Log auditing with auditd to track events, record the events, and even detect abuse or unauthorized activity, in addition to, using custom reporting options.

These tools in addition to archives, backups, scripting, and task automation all contribute to a fully comprehensive log management eco-system.

Now, we'll expand on this log management system by learning new tools, adding advanced features, and researching additional concepts to enhance our system. 

#### `tar`: Create, extract, compress, and manage tar backup archives.

Creating tar archives is part of your daily job functions. Today, you have decided to expand upon your knowledge of tar by learning how to extract or exclude specific files and directories to help speed up your workflow.

1. Strip the files `investments1.txt` and `Assests_1.txt` into a directory named `~/MyFinancials` from `Tardocs.tar` in  the `/Projects` directory. Extract the files without the directory structure.


2. Uncompress TarDocs.tar into a directory called `TarDocs`. Next, create a `tar` archive called `MyFinancials.tar` that excludes the `Java` directory from the `TarDocs/Document/` directory. 
   

3. **Bonus:** Create an incremental archive called `logs_backup.tar.gz` that contains only changed files by examining the `snapshot.file` for the `/var/log` directory.


#### `cron`: Create, manage and automate various cron jobs.

In response to a ransomware attack, you have been tasked with creating an archival and backup scheme to mitigate against CryptoLocker malware. This attack would encrypt the entire server’s hard disk and it can only be unlocked using a 256bit digital key after payment using bitcoin. 


1. Create a cron job using the following specs:

   - Create archive for the following directory: `/var/log/auth.log`
   - Save the archive to the following directory: `/`
   - Name the archive: `auth_Backup.tgz`
   - Run every Wednesday at `6AM`
   - Compress the archive using `gzip`


#### `bash scripting`: Write basic bash scripts.

Portions of the Gramm-Leach-Bliley Act require organizations to maintain a regular backup regimen for the safe and secure storage of financial data. 

1. Create an executable Bash script called `system.sh` using the following specifications:

   - Using brace expansion, create the following four directories to save your work:
      - `~/home/backups/freemem`
      - `~/home/backups/diskuse`
      - `~/home/backups/openlist`
      - `~/home/backups/freedisk`


2. Create a script called `system.sh` that does the following:

      - Prints the amount of free memory and saves it to `~/home/backups/freemem/free_mem.txt` directory.

      - Prints disk usage and saves it to `~/home/backups/diskuse/disk_usage.txt` directory.

      - Lists all open files and saves it to `~/home/backups/openlist/openlist.txt` directory.

      - Prints file system disk space statistics in “human readable” format and saves it to `~/home/backups/freedisk/freedisk.txt` directory.
      
      - **Note:** Ignore the warning `lsof: WARNING: can't stat() fuse.gvfsd-fuse file system /run/user/1001/gvfs Output information may be incomplete.`

3. Make the `system.sh` script executable.

4. **Bonus**: Automate your script `system.sh` by adding it to the `weekly` system wide cron directory.


#### `journalctl`: Perform various log filtering techniques.

There was a suspicious logon from a host on the network during the early morning hours when the office is closed. The Senior Security Manager tasked you with filtering through log files to determine if a system breach occurred.

1. Using `journalctl`, perform a log search that returns all  `boot` log message priorities for `alert` and higher, against the current system boot.

2. Use `journalctl` to check the size of the system disk journal for the most recent boot.

3. Use `journalctl` to remove all archived journals except the most recent two.

4. **Bonus**: Use `journalctl` to filter all log messages with priority levels between `0` and `2` and save the results to a file named `Priority_High.txt` in `/home/student/` directory.

5. **Bonus**: Automate the last task by creating a `cron` job that runs `daily` in the user crontab.


#### `rsyslog`: Priority based log file creation.

Your organization is constantly bombarded with spam messages, a form of **social engineering** attacks. To address this, you’ve decided to implement a priority based log filtering system to monitor access to the mail daemon.   

1. Configure `rsyslog` to record `mail`log message for all priorities “EXCEPT” `debug` to the `/var/log/mail.log` directory.

2. **Bonus**: Configure `rsyslog` to record `boot` log message for priorities except `info` and `debug` to the `/var/log/boot.log` directory.

#### `logrotate`: Manage log file sizes.

Because of the spam messages, you realized that the size of the log files are becoming unmanageable. 

You’ve decided to implement log rotation in order to preserve log entries and keep log file sizes more manageable. You’ve also chosen to compress logs during rotation to preserve disk space and lower costs.


1. Configure a log rotation scheme that backs up authentication messages to the `/var/log/auth.log` directory using the following settings:
   
      - Rotates weekly.
      
      - Keep the most recent 7 logs only.
      
      - Does not rotate empty logs.
      
      - Delays compression.
      
      - Skips error messages for missing logs, then continues to next log.
   

#### `auditd`: Check for policy and file violations.

In an effort to help mitigate against future attacks, you have decided to create an event monitoring system that specifically generates reports whenever new accounts are created or modified and when any modifications are made to authorization logs. 

1. Verify the `auditd` service is active using the `systemctl` command.


2. Edit the `/etc/audit/audit.conf` file with the following parameters.

      - Number of retained logs is 7

      - Maximum log file size is 35.
   
   
3. Using `auditd`,  edit ` /etc/audit/rules.d/audit.rules` and create a rule that watches the following paths:

      - For `/etc/shadow`, set `wra` for the permissions to monitor and set the `keyname` for this rule to `hashpass_audit`.

      - For `/etc/passwd`, set `wra` for the permissions to monitor and set the `keyname` for this rule to `userpass_audit`.

      - For `/var/log/auth.log`, set `wra` for the permissions to monitor and set the `keyname` for this rule to `authlog_audit`.
      

      - Restart the `auditd` daemon.
      

      - Perform a listing that reveals all existing `auditd` rules.
      

4. Produce an audit report that returns results for all user authentications.
- **Note:** You will need to log out and back in to populate the report. 

5. Time to shift into hacker mode: Create a user  `sudo useradd attacker` then produce an audit report that lists account modifications.


6. Add another rule using `auditctl` that watches the `/var/log/cron` directory.
   
      - Perform a listing that reveals changes to the `auditd` rules took affect.

