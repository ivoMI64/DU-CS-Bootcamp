## Activity File: Creating a Report with `wmic` Output

In this activity, you will continue in the role of junior systems administrator at Good Corp, Inc.

- Your CIO wants you to run `wmic` queries to continue baselining the system, including the Windows edition and the build number.

- You also have to retrieve a list of disk information details.  

- The CIO also wants you to append these results to your `report.txt` file.

Before continuing with your activities, remember to navigate to the `reports` directory.

Please continue to use the **Windows 10 virtual machine located in Hyper-v**. 

### Instructions

1. Using one command, append the following `wmic` queries to your report file as one output:

    - Windows edition
    - Build number

- Note that you can run `wmic os get /value` to see the different values that can be retrieved from the `os` `wmic` alias.

2. Using one command for each bullet point below, append the following to your report file using `wmic` queries and other system commands:

    - Filesystem, Free space, Device ID, Size, Volume serial number
    - Program file directories for 64-bit and 32-bit programs
    - SID, important directories, and files
    - Number of times all users have logged on, and last logon
    - Windows update information 
    - Startup application list 
    - Startup services list

    *Hint: Make sure you verify each output before outputting it to your `report.txt` file.*


----

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
