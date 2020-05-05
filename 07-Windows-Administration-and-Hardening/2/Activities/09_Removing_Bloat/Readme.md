## Activity File: Removing Windows Bloat with PowerShell Scripts

In this activity, you will be continuing your role of a junior system administrator. 

- As a system administrator, we don't want our users playing games while at work. One reason is that these games can potentially expose personal user email addresses, usernames, or other personal identification information to the Windows Store AppxPackage.

- The CIO has tasked us with creating a PowerShell script that will get rid of Windows bloat applications, and provided a CSV file containing a list of these applications. 

Use the following files to complete the activity: 

- [Bloat CSV File](Activities/09_Removing_Bloat/microsftbloat.csv)
- [Syntax Reference and Helpful Hints](./Activities/09_Removing_Bloat/tips.md)

- Please continue to use the **Windows Host Computer** for this activity. 

### Instructions

1. Make sure you enable PowerShell scripts with: `Set-ExecutionPolicy RemoteSigned`. 


2. Create a PowerShell script file called `remove_bloat.ps1` in `C:\Scripts` directory.

    - The file can be tested with `.\remove_bloat.ps1` in PowerShell.

3. Import the CSV `microsoftbloat.csv` using the `$csv` variable.

    - For each `$line` of the `$csv` variable, use a `foreach` function to retrieve each Windows 10 `.appxpkg` with the `Get-AppxPackage` cmdlet.

    - Make sure to use the parameter to retrieve the application for all users.

4. Ensure that `Get-AppxPackage` calls a package with the `-Name` parameter and is then piped to `Remove-AppxPackage -Verbose`.

    -  When you successfully create and execute the script, PowerShell will show the `Deployment operation progress: ...` output at the top of the terminal and verbose at the bottom.

**Bonus** 

- Under the cmdlet pipeline, print a line that states `Windows bloat, {line.name here} removed!` using the proper CSV application name field instead of the placeholder.

  _Hint: If you're not sure what fields exist in the CSV file, open it!_

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
