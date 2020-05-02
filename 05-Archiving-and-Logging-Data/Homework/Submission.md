## Submission File for Unit 5: Archiving and Logging Data Homework

Please edit and save this file while updating it with the commands and file (configuration and rules) edits you used to solve your homework.

---

### `tar`: Create, extract, compress, and manage tar backup archives

Command to **extract** the `TarDocs.tar` archive to the current directory:

- `YOUR SOLUTION COMMAND HERE`

Command to **create** the `Javaless_Doc.tar` archive from the `TarDocs/` directory, while excluding the `TarDocs/Documents/Java` directroy:

- `YOUR SOLUTION COMMAND HERE`

Ensuring `Java/` is not in the new `Javaless_Docs.tar` archive:

- `YOUR SOLUTION COMMAND HERE`

**Bonus:** Command to create an incremental archive called `logs_backup_tar.gz` with only changed files to `snapshot.file` for the `/var/log` directory.

- `YOUR SOLUTION COMMAND HERE`

#### `tar` Critical Thinking

Why wouldn't you use the options `-x` and `-c` at the same with `tar`?
---

### `cron`: Create, manage and automate various cron jobs

Cron job for backing up the `/var/log/auth.log` file:

- `YOUR CRON LINE HERE`

---

### `bash scripting`: Write basic bash scripts

Brace expansion command to create the four subdirectories:

- `YOUR SOLUTION COMMAND HERE`

Command and file edit to create `system.sh` (you can copy and paste it here):

- `YOUR SOLUTION COMMAND HERE`

- Within the script, have the following:

    ```bash
    #!/bin/bash
    `YOUR SOLUTION SCRIPT CONTENTS HERE`
    ```

Command to make the `system.sh` script executable:

- `YOUR SOLUTION COMMAND HERE`

Commands to to confirm script's execution:

- `YOUR SOLUTION COMMAND HERE`

- `YOUR SOLUTION COMMAND HERE`

- `YOUR SOLUTION COMMAND HERE`

- `YOUR SOLUTION COMMAND HERE`

Command to copy `system` to system-wide cron directory:

- `YOUR SOLUTION COMMAND HERE`

---

### `journalctl`: Perform various log filtering techniques

Command to return `journalctl` messages with priorities from emergency to error:

- `YOUR SOLUTION COMMAND HERE`

Command to return `systemd-journald` messages:

- `YOUR SOLUTION COMMAND HERE`

Comand to prune archived journal files except the most recent 2:

- `YOUR SOLUTION COMMAND HERE`

**Bonus** Command to filter all log messages with priority levels between 0 and 2, output to `/home/sysadmin/Priority_High.txt`

- `YOUR SOLUTION COMMAND HERE`

**Bonus 2** Command and file edit to automate the last command in a daily cronjob:

- `YOUR SOLUTION COMMAND HERE`

- Within the `crontab` file, add the following:

    ```bash
    YOUR SOLUTION CRON HERE
    ```

---

### `rsyslog`: Priority based log file creation

Command and file edit to record all `mail` log messages, except for `debug` to `/var/log/mail.log`:

- `YOUR SOLUTION COMMAND HERE`

- Add within the configuration file:

    ```bash
    `YOUR SOLUTION EDIT HERE`
    ```

Command and file edit to record all `boot` log messages, except for `info` and `debug` to `/var/log/boot.log`:

- `YOUR SOLUTION COMMAND HERE`

- Add within the configuration file:

    ```bash
    `YOUR SOLUTION EDIT HERE`
    ```

---

### `logrotate`: Manage log file sizes

Command and file edit that backs up authentication messages to `/var/log/auth.log`:

- Run `sudo nano /etc/logrotate.conf` to edit the `logrotate` configuration file.

- Add within the configuration file:

    ```bash
    `YOUR LOGROTATE SOLUTION HERE`
    ```

---

### BONUS ACTIVITY `auditd`: Check for policy and file violations.

Command to verify `auditd` is active:

- `YOUR SOLUTION COMMAND HERE`

Command and file edit to set number of retained logs and maximum log file size:

- `YOUR SOLUTION COMMAND HERE`

- Add within the configuration file:

    ```bash
    YOUR CONFIGURATION SOLUTION HERE
    ```

Command and file edit using `auditd` itself to set rules for `/etc/shadow`, `/etc/passwd` and `/var/log/auth.log`:

- `YOUR SOLUTION COMMAND HERE`

- Add within the `rules` file:

    ```bash
    YOUR RULES SOLUTION HERE
    ```

Command to restart `auditd`:

- `YOUR SOLUTION COMMAND HERE`

Command to list all `auditd` rules:

- `YOUR SOLUTION COMMAND HERE`

Command to produce an audit report:

- `YOUR SOLUTION COMMAND HERE`

Command to use `auditd` to watch `/var/log/cron`:

- `YOUR SOLUTION COMMAND HERE`

Command to re-verify `auditd` rules:

- `YOUR SOLUTION COMMAND HERE`

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
