## Activity File: Hardening with Two More GPOs 

### Instructions

Using the `Active Directory Users and Computers` tool, create a new `GC Computers` OU under the `GOODCORP.NET` domain:

- Now choose at least two of the following GPOs to create and link:

  - `Disabling Local Link Multicast Name Resolution`

  - `Require passwords with a minimum of 15 characters to negate LM hashes`

  - `Enable verbose PowerShell logging and transcription`

Check the corresponding instructions below for implementing each domain hardening GPO.

#### Disabling Local Link Multicast Name Resolution GPO

Complete the following steps to create this GPO:

- Create a new GPO called `No LLMNR`.

- `Edit` the GPO and add the policy: `Computer Configuration` > `Policies` > `Administrative Templates` > `Network` > `DNS Client` > `Turn Off Multicast Name Resolution`.

  - Enable the policy: `Turn Off Multicast Name Resolution`.

  - Click `OK` and exit the `Group Policy Management Editor`.

- Link this GPO to the `GC Computers` OU.

#### Requiring Passwords with a Minimum of 15 Characters to Negate LM Hashes GPO

A good way to implement secure password policy is simply by increasing the minimum character requirement. Many institutions debate the ideal amount, but for Windows, the minimum is 15.

This is because of **LAN Manager hashes (LM)**. As mentioned earlier, the LAN Manager authentication protocol is an outdated, insecure protocol. Due to its outdated hashing algorithm, it will incorrectly hash half of the password for passwords up to 14 characters. This part of the password can be easily cracked. However, it's been found that for passwords of at least 15 characters, Windows is unable to store the LM hash properly.

[Read more about preventing LM hashing here.](https://support.microsoft.com/en-us/help/299656/how-to-prevent-windows-from-storing-a-lan-manager-hash-of-your-passwor)

Remember that to avoid needing a separate GPO to disable LM hashing (though we can do this for extra security), we're simply going to enforce passwords to be at least 15 characters. Let's look at how to apply this GPO to our Windows workstation.

Complete the following steps to create this GPO:

- Create a new GPO called `Password Require 15 Characters`.

- `Edit` the GPO and add the policy: `Computer Configuration` > `Policies` > `Windows Settings` > `Security Settings` > `Account Policies` > `Password Policy`.

  - Double-click the policy: `Minimum Password Length`.

    - Check `Define this policy setting` and set passwords to be at least `15` characters.

  - Click `OK` and exit the `Group Policy Management Editor`.

- Link this GPO to the `GC Computers` OU.

Explain that the next time a user changes their password on this machine, a 15 character minimum password policy will be enforced. This prevents any passwords from being insecurely hashed by LAN Manager.

#### Enabling Verbose PowerShell Logging and Transcription GPO

As mentioned in a previous class, PowerShell is often used as a "living off the land" hacker tool—once a hacker gains access to a Windows machine, they will leverage PowerShell as much as possible to achieve their goals.

So why not just completely disable PowerShell?

- Many security tools and system administration management operations, such as workstation provisioning, require heavy use of PowerShell to set up machines.

- Best practices for enabling or disabling PowerShell are debated, often leading to the subject of app whitelisting, which is when you only enable certain applications. These setups require a heavy amount of configuration with tools such as AppLocker. 

- This is why we're going to use a PowerShell practice that is recommended regardless of whether PowerShell is enabled or disabled: we are going to enable improved PowerShell logging and visibility.

This GPO will incorporate multiple policies into one (they are all under the same policy collection).

Complete the following steps to create this GPO:

- Create a new GPO called `Log PowerShell` and do the following.

- `Edit` the GPO and add the policy: `Computer Configuration` > `Policies` > `Administrative Templates` > `Windows Components` > `Windows PowerShell`.

  - `Enable` the `Turn on Module Logging` policy and do the following.

    - Since we want to log _all_ PowerShell modules, enter an asterisk `*` (wildcard) for the `Module Name`, then hit `OK`.
    - Click on `Show` next to `Module Names`

  - `Enable` the `Turn on PowerShell Script Block` policy.

    **Note:** Do you remember the `Invoke-Command -ScriptBlock {mkdir "C:\Logs\" -Force} -Session $Session` bonus activity from our class on PowerShell?

    - This cmdlet let you create the remote logging directory as part of a session script.

    - Now this policy will let you log all script blocks, such as: `{mkdir "C:\Logs\" -Force}`

  - `Enable` the `Turn on Script Execution` policy and do the following.

    - Set `Execution Policy` to `Allow local scripts and remote signed scripts`.

    **Note:** If you remember the `Set-ExecutionPolicy` cmdlet we ran during the PowerShell exercises, this policy can enforce those settings as part of a GPO.

  - `Enable` the `Turn on PowerShell Transcription` policy and do the following.

    - `Transcription` means that an exact copy of the the commands are created in an output directory.

    - Check the `Include invocation headers` option. This will add timestamps to the command transcriptions.

  - Do not change `Set the default source path for Update-Help`.

  - Click `OK` and exit the `Group Policy Management Editor`.

- Link this GPO to the `GC Computers` OU.

The Windows machines in this OU will now verbosely log all PowerShell commands. This is important for tools like SIEMs and for forensics operations, as it helps combat obfuscated PowerShell payloads.