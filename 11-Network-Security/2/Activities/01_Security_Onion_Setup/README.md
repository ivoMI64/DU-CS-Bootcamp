## Activity File: Security Onion Setup

To prepare for the labs, we will all log into Azure and launch an instance of Security Onion. This will generate alert data that will allow us to complete the labs.

Log in with the following credentials:

- Username: `sysadmin`
- Password: `cybersecurity`

### Instructions 

1. First, we will all verify that our network security monitoring (NSM) tools are working before starting the labs. Click on **Applications** > **Other** > and scroll down to **Terminal**. Click to launch the terminal type the following command:
   
   - `sudo so-status`
   
   Break down the command:
   
   - `so-status`: Checks the status of currently installed NSM tools.
   
   Output should look similar to below:
   
   ![NSM Status](SO%20Status.png)
   

   - Ensure all statuses are listed as `OK`.
   - If not, keep running the `so-status` command for a few minutes. (It can be slow.)
   - If any of the statuses are not listed as `OK` after a few minutes, restart the NSM tools with the following command:

      - `sudo so-restart`
   
      Break down the command:
   
       - `so-restart`: Restarts Security Onion's NSM tools.

   - Run the `so-status` command again for a few minutes. All systems should be listed as `OK` after a few minutes.


2. Before beginning the lecture, everyone will need to generate alerts.  

   Type the following command:

      - `sudo so-replay`

   Break down the command:

   - `so-replay`: Command used by Security Onion to "replay" all PCAP files from previously captured malware.

   - It can take as long as 10 to 15 minutes for Security Onion to run all of the PCAPs.

- **Note** `so-replay` should be completed before starting the activities.

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
