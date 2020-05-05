## Activity File: Removing Unwanted Programs and Services  

In the last activity, we added a list of services and startup applications to your report. Your CIO was concerned about a few of them and has asked you to do the following:

- Disable the game launcher application Steam.

- Remove the Teamviewer service from start up, so there are no remoting applications installed on workstations in the office. 

- Remove anything named "Adobe Flash," using the applications settings GUI.

- Remove QuickTime and all Apple updating and supporting applications.

- Please continue to use the **Windows 10 Hyper-V machine**. 


#### Instructions

#### Disabling Startup Applications (Task Manager)

1. Using the Task Manager, find the application called Steam Client Bootstrapper and disable it from automatically starting up. 

    - Your CIO hasn't asked you to uninstall it, but since Steam has many desktop and productivity applications, your CIO wants to "examine" the library further. 

    *Hint: In addition to launching from the `Start` menu search, there is a keyboard shortcut for launching Task Manager. Use this method to launch Task Manager, and if you're stuck, ask your instructor or a classmate.*

#### Disabling Startup Services (`services.msc`)

2. Using `services.msc`, find the Teamviewer service and disable it. Your CIO has mentioned that Teamviewer has vulnerability issues. 
    - Since this Windows machine will become an office-only workstation, this is a potential attack vector that needs to be disabled.

#### Uninstall Program (GUI)

3. Using the standard Windows application settings GUI, remove any and all applications named "Adobe Flash."  

#### Uninstall Programs (`CMD`/`wmic`)

4.  Use the command line to remove the media player QuickTime and any Apple applications.  

    - Launch `CMD` with administrator privileges.

    - Use `wmic` to get all product information.

    - Verify that QuickTime is one of the listed products and then use `wmic` to uninstall QuickTime.

    - There should also be an Apple product listed. Verify this, and then use `wmic` to uninstall.

     _Hint: You will need a `call` option when uninstalling products._

5. Lastly, verify that these products were installed successfully. (Remember that successful uninstalls will display `ReturnValue = 0;`.)

----

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
