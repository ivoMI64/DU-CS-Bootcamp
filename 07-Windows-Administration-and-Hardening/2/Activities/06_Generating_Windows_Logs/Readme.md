## Activity File: Generating Windows Event Log Files with Parameters and Pipelines

In this activity, you will play the role of a Windows system administrator. 

- You are tasked with creating and saving logs to the directory `C:\Logs`.

- These logs can then be sent to security analysts for examination in a Security Information and Event Management System (SIEMS). 

- Please continue to use your **Windows host machine**. 

### Instructions

Your CIO has tasked you to do the following in PowerShell:

1. Use `Get-WinEvent -listlog *` to show the list of available logs.

2. Check for and retrieve the names of the security, application, and system log names.

3. For each of the above logs, create a pipeline that:

    - Gets the latest 100 events.

    - Transforms the log to `json`.

    - Outputs the objects in the `json` file to the `C:\Logs` directory.

4. To complete this activity, you will need to use the `Get-WinEvent`, `ConvertTo-Json`, and `Out-File` cmdlets.

_Hint: Don't forget that you must surround parameter values that include spaces with quotes_ (`""`).

At the end of this activity the following files should be in `C:\Logs`:

- `RecentSecurityLogs.json`
- `RecentApplicationLogs.json`
- `RecentSystemLogs.json`

This means you'll need to run the PowerShell pipeline at least three times.

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
