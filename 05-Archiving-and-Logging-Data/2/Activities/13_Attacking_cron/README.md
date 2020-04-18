## Activity File: Attacking `cron`

So far, as a junior administrator at Rezifp Pharma Inc., you’ve used `cron` to schedule user and system-wide `cron` jobs for maintenance and security tasks. However, a root crontab is running system-level jobs with root privileges, which poses a security risk to your organization.

- Your CISO issued a security bulletin stating there's been a recent increase in cronjob attacks, resulting in exploits that provide attackers with persistent backdoor access into numerous networks. 

- The CISO made the decision to mitigate this threat by enacting security measures that ensure the integrity of the organization's network by only allowing services required for specific business purposes.

- You must locate and identify an active threat, learn how it was connected, and kill the root causes. 

Below, you'll find a list of the ports and services authorized by the security department. Any connections to ports not indicated below must be terminated immediately. Their root causes should be found and dealt with.

- `993` (`imap2`) 
- `80` (`http`)
- `20` (`ftp`)
- `22` (`ssh`)
- `25` (`smtp`)


### Instructions

Reverse shells are but one of the many tools, tactics, and procedures (TTPs) that attackers use to establish persistence within a network. As the guardian of your organization's network, it's your responsibility to ensure the integrity of that network. This means you must discover and eradicate these threats before they can be leveraged by attackers to achieve persistance on your network.

You've ensured that your network is protected from the outside in. Now, do the same from the inside out.

#### Identifying Rogue Connections

1. Begin by identifying the rogue connections.

    a. Inspect your network connections. 

     **Note**: If you run this with normal user privileges, you will not see all connections on the machine. Run the appropriate command with root privileges to see all connections.

    b. Use `grep` to extract information only about _established_ connections. Save this to a file called `established_connections.txt`.

    c. Inspect the file's contents and look at the foreign address and port column. Identify connections to suspicious ports, and note their PID numbers.

#### Inspecting Processes

2. Learn how these connections were created, and kill them before eliminating them at the source.

    a. Inspect all running processes and use `grep` to extract information about only the specific processes you're interested in. Save this to a file called `connection_process_details.txt`.

    b. Look at the very last line of your output. This contains the command or script that was run to start each process. Verify that you have this information before proceeding.

    c. Kill both processes and then verify that the connections have indeed been closed.

#### Eliminating the Root Cause

3. Use what you learned in the previous step to prevent the problem from occurring again.

    - Note the commands used to open the suspicious connections. Based on these commands, identify which one may be a problem again, and which one was likely to be permanently eliminated.

    - Inspect processes again to identify which user started the process. Use this to identify where the malicious script is being called from.

    - Update the file, then describe your change in a file called `summary.txt`, saved in the same directory as the other files you created.