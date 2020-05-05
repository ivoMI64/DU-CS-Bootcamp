## Activity File: Setting Up an Active Directory Domain Controller

Your company, Good Corp, Inc. decided to start offering managed IT services for clients with Windows-based environments.

Your CIO has chosen to use Active Directory to centrally manage the company's own domain for current and future Windows users, but to also act as a small-scale prototype for the company's new offered services.

Consider the following when completing this activity:

- After applying settings changes, you'll be prompted to restart Windows Server 2019 or Windows 10. Make sure you restart when prompted and then wait a minute or two before relogging into the RDP sessions.

### Instructions

#### Setting up the Windows Server 2019  

1. Set the Windows Server's `Computer Name` to `ad` for Active Directory. 
    - This was not covered in the demo, but can be set in the `Local Server` window. Note that you may have to reboot after doing this. It's recommended that you review the rest of the instructions while waiting for the reboot. 

2. Add the roles `Active Directory Domain Services` and `File Server` to Windows Server 2019.

3. Use the following settings:

    - Set up the role with a `Add a new forest`.

      - Set the domain to `GoodCorp.net`.

    - Set the forest and domain functional level to `Windows Server 2016`. 
      - This allows backwards compatibility with `AD 2016` domain functionality.

    - If you set the `Computer name` properly, the NetBIOS name _should_ automatically be set to: `ad`.

    - Keep the default `logging directories` as they are.

    - Set the `Directory Services Restore Mode (DSRM) password` to something you'll remember.

    - Promote the server to a `Domain Controller`.

#### Joining the Windows 10 Workstation

4. Use `sysdm.cpl` to quickly launch the `System Properties` control panel window. 

5. Use the following credentials to join the Windows 10 machine to the domain:

    - Username: `sysadmin`
    - Password: `p4ssw0rd*`

6. Save the PowerShell script during installation under `C:\Scripts` for future Active Directory domain setups.

**Troubleshooting:** If your Windows 10 workstation will not join the active directory domain, you may see the error: `An active directory domain controller (AD DC) for the domain 'goodcorp.net' could not be contacted`
  - This error arises because the domain name `goodcorp.net` cannot be resolved to an IP address. 
  - To resolve this error, the DNS settings of the Windows 10 virtual machine must be set to the IP Address of the Windows Server virtual machine.
  - Review the instructions for [Setting up a Static IP Address.](../../../Resources/Static_IP_Instructions.md)

--- 
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.