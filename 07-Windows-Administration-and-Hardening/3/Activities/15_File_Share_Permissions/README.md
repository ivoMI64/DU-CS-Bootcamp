#### Instructions

- Create a network file share named `Dev` and add the `Development` group.

  - Make sure to also add the `Write` permission.

  - Disable inheritance and convert inherited permissions to explicit permissions.

  - Make sure to remove the two `User (GOODCORP\Users)` principals.

- If you didn't add Andrew's domain account before to the remote Windows 10 machine, you'll need to do that now.

  - These settings can be found in `Remote Desktop settings`:

- Reboot the Windows 10 machine and reconnect to it.

- Log into the Windows 10 machine as `GOODCORP\Bob` with the previously set password: `Ilovesales!`.

- Open the file explorer and attempt to navigate to `\\ad\dev` with `Bob`.

**Bonus 1**

Set up all of the permissions required for the `Sales` group to access a file share named `Sales`.

Add `Andrew` as a remote user for the Windows 10 machine and test their access to `\\ad\sales`.

**Bonus 2**

Retrieve the SIDs for your `Domain` and then the `Sales` and `Developer` groups.

You can use the following PowerShell commands on the Windows Server to double-check SIDs and RIDs.

- `Get-ADUser -Filter * | Format-List Name, SID`

- `Get-ADPrincipalGroupMembership -Identity Bob | Format-Table -Property Name, SID`

- `Get-ACL \\ad\dev | Format-List`
