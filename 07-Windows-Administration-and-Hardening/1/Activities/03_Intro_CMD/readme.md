## Activity File: Intro to Task Manager and `CMD`

Throughout this week, you will be creating and scheduling baseline reports on this Windows machine, and cleaning up and hardening the machine before joining it to an Active Directory Domain Controller later in the week.

In this activity, you are taking on the role of a junior systems administrator at Good Corp, Inc.

* A senior software developer who recently left the company used the Windows operating system and environment, despite the rest of the developers using Mac computers and devices. This means there is now a single Windows workstation in the office. 

* There are currently no established policies in place for administrating a Windows workstation.

*  Your CIO has requested that you use the Windows command prompt to find information about and generate a baseline report of a Windows system.

* You'll be using the command line to create a simple text file called `report.txt` to begin appending Windows system information to.

### Instructions 

Start by logging into the **Windows 10 virtual machine located in hyper-v** with the following credentials:

- Username: `sysadmin`
- Password: `cybersecurity`

The CIO has asked you to do a few preliminary tasks in order to start this provisioning process:

**Find the CPU-thrashing process.**

1. There is an errant task on the machine that is causing CPU usage spikes. Use Task Manager to find and end the process.

**Create a `reports` folder and an initial `reports.txt` file with a title and subtitle.**

2.  Use the command line to create a `reports` folder on the user's desktop in which you'll store your findings.

3. Print a line that reads `Baselining Report` and output it to a new `report.txt` file. This will create a title within your report.

4. Print another line titled `Created by [your name here]` and append it to the file.

**Add to the report using ENV variables in the command line.**

5.  Add the OS, date, and user to the report. Using the command line, add the following line to your report: `[operating system] system report created on [today's date] with logged in user, [current username]`, using environment variables in place of the placeholders.

----

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
