## Activity File: PowerShell Remoting 

In a previous activity, we created some `json` formatted log files using the `Get-WinEvent` cmdlet, along with other commands in a command pipeline. Now we're going to transport these log files to a Windows Server directory for our CIO to inspect later.

In this activity, you are playing the role of junior system administrator tasked with transferring log files to a Windows Server directory.

You will construct a script to send the `Get-WinEvent` security log `json` files from your host machine to the Windows Server hyperV machine.

Hint: If you need help using a command, use `Get-Help Copy-Item -examples`.

The credentials for the Windows Server VM are:
- **Username**: **sysadmin**
- **Password**: **p4ssw0rd***

### Instructions

1. Begin by by doing the following: 

    - Ensure that you have the latest help documentation for PowerShell with `Update-Help`.

    - Confirm that WinRM remoting is enabled on your Windows 10 host machine by running `winrm quickconfig`.

    - Add the Windows Server 2019 IP as a trusted host by running the following:

         `Set-Item WSMan:\localhost\Client\TrustedHosts -Value <server IP>`
 

2. Use a remote **interactive** PowerShell session to the Windows Server and create a `C:\Logs` directory. Use your remoting password to start your session.

3. Create a `$Session` variable with `New-PSSession` and the following parameters:

   - `ComputerName` should be set to `<your-server-ip-address>`.
        - If `-ComputerName` doesn't connect, try `VMName "Windows Server"`

   - `Credential` should be set to `"sysadmin"`.

4. Use the `Copy-Item` cmdlet that uses the variable you just made, and set the destination to the `C:\Logs\` directory in the Windows Server machine.

5. While we didn't cover this in the demo, you are also tasked with adding a new line to our script. 
    - Your CIO wants visual confirmation on the screen after each log transfer, with the following message. Set the following line to appear `"Copied $log to Windows Server C:\Logs directory!"`, using `Write-Output`. 
    - Set `$log` to `"RecentSecurityLogs.json"` under `$Session`. 
    - You can test this command separately in PowerShell to see how it will look.

6. Don't forget to end the script's session when it's done running.

7. Using an interactive session, log into the remote server to navigate and verify your `RecentSecurityLogs.json` file exists in the Windows Server `C:\Logs\` directory.

8. `exit` from the remote server when done.

#### Bonus 

Try to use the `Invoke-Command` cmdlet to create the `C:\Logs` directory in the Windows Server machine.

- Use `Get-Help` if needed.

- This cmdlet would come _after_ the `$Session` variable is set up, and before the `Copy-Item` cmdlet.

This bonus uses a new parameter, `-ScriptBlock`:

- The `-ScriptBlock` parameter only needs `{mkdir "C:\Logs" -Force}`. But it also needs a session parameter set up. The `-Force` parameter makes sure the rest of the script doesn't fail if the directory already exists.

- To make sure it's creating the `C:\Logs` directory, create an interactive session to delete it before running your script.

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
