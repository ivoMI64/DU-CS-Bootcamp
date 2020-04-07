### Activity File: Building an IP Lookup Tool  
  
- You continue in your role as security analyst at Wonka Corp.

- Wonka has been experiencing more attacks on their network.

- Your manager needs to know what country these attacks are coming from, as Wonka Corp can block a country from accessing their network.

- You manager is impressed with the great work you did on the last script, and would like you to design a script that can look up the country of several IP addresses pulled from the logs.

#### Instructions:

Using only the command line, create and move into a new directory called  `IP_Lookup_Tool` in the `/home/sysadmin/Cybersecurity-Lesson-Plans/03-Terminal/student_day3/` directory. From there, complete the following tasks:
  
1. You have been provided the following new command to look up details for an IP address:

     - To look up information on the IP of 104.223.95.86, you would run:  

        `curl -s http://ipinfo.io/104.223.95.86`

       - *Hint: Read the man page of the `curl` command to learn more about what it can do.*

    - Using  pipes, `grep`, and `awk`, modify the `curl` command to display only the Country.

      - *Hint: Use `grep` to display only the line that contains the Country.*  
      - *Hint: Use `awk` to parse out the Country from that line.*
  2.  Place the command into a new shell script called `IP_lookup.sh`.

  3.  Modify the script so the IP address is an argument that can be passed into the script.

  4. The IP addresses below were found in Wonka's log files. Run your new  `IP_lookup.sh` with these IP addresses as arguments to determine their countries:
       - IP 1: 133.18.55.255
       - IP 2: 41.34.55.255
       - IP 3: 187.54.23.8
