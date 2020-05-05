### Understanding Resource Permissions and Setting Up a Network File Share

Reflect back on the third day of the Windows unit. In the last activity, we implemented multiple `GPOs` to be applied to domain computer organizational units. That was an exercise in implementing `policy` to secure our domain.

However, policies don't control access to resources. These are done through `Access Control Lists (ACLs)` and `Security Identifiers (SIDs)`.

Understanding how `Access Control Lists` and `SIDs` work is vital to understanding resource permissions in a Windows environment. System administrators need to routinely manage and audit resource `ACLs` throughout their domain to manage access and restrictions while hackers may try to enumerate `ACLs` and `SIDs` within a domain to check for obfuscated `Administrator` account names and to see which groups have permissions to valuable domain resources they want access to.

Any object in a domain that can authenticate to `Active Directory Domain Services` is called a `security principal` and that each one is identified by a `Security Identifier`.

Every file and directory has an `Access Control List`. With `SIDs`, `Active Directory` manages permissions to these file and directory resources. Whenever a user logs into the domain, they receive a `token` that contains their individual domain user SID and any SIDs for groups that they are part of.

For example, our user `Bob` has a token with his own individual SID and a group SID that is associated to the `Sales` group. We'll look at how check out `ACLs` and `SIDs` now.

If we wanted to see an AD user's SIDs, we could use the following command:

- Type `Get-ADUser -Filter * | Format-List Name, SID`.

This command will retrieve all AD user's and return their `Name` and domain user `SID`.

- Run the command and notice Bob's `SID`:

  ```PowerShell
  Name : Instructor
  SID  : S-1-5-21-1631281936-2151775305-3445712239-500

  Name : Guest
  SID  : S-1-5-21-1631281936-2151775305-3445712239-501

  Name : krbtgt
  SID  : S-1-5-21-1631281936-2151775305-3445712239-502

  Name : Bob
  SID  : S-1-5-21-1631281936-2151775305-3445712239-2106

  Name : Andrew
  SID  : S-1-5-21-1631281936-2151775305-3445712239-2110
  ```

The SID in a Windows domain has three relevant main components. Here are the main components:

---

Our SIDs follow the syntax: `S-1-5-domain-RID`.

The first part `S-1-5` consists of:

- `S-1` is the prefix for the version of SID that all Windows currently use.

- The `5` is `Identifier Authority`, or in this example, `NT Authority`. It is used to create SIDs for all `NT-based operating systems`, which is essentially, Windows.

The next two parts are important as they identify the domain and objects in the domain:

- The next part: `21-1631281936-2151775305-3445712239` these next four sections are the `domain identifier`, or in our case, `GOODCORP`.

- The last part: `2106` is also known as the `Relative ID (RID)` or "relative to domain" identifier that is assigned to every object. Each object in the domain, such as a user, has a unique `RID`.

In our case, Bob is assigned to the unique RID, `2106`. No other user or security principal object will have the RID `2106` in our domain.

While we use understandable names to identify security principals, such as the user, `Bob`, or the group, `Sales`, Active Directory manages these objects by their `SIDs`.

When Active Directory assigns permissions to resources, it creates a list of allowed SIDs for each resource, and does not use the `name` of the user, group, or other principal.

This allows resources to have a permissions list with only unique IDs. For example, the HR department of a company usually assigns an employee ID number to each employee. You may have two `John Smith`s but they would each have a unique employee ID number.

### Create a Sales File Share and Test the Permissions

Now that we know the underpinnings on how resource permissions work, let's look at creating a file share resource for _only_ the `Sales` group.

In this guide, we will complete the following steps:

- Create a file share for the `Sales` group

- Check the ACLs of the file share.

First, let's look at how to create a shared folder.

#### Create a File Share for the Sales Team

- In the `Server Manager` click on `File and Storage Services`. This should have been added during the first activity. If not, add `File Servers` now.

- Click on the `Shares` tab to show current shared files and folders.

- Click on `TASKS` then `New Share` to the right of `Shares | all shares`.

- On the `Select the profile for this share`, make sure `SMB Share - Quick` is highlighted and click `Next >`.

- On the `Select the server and path for this share` window, Click `Next >`.

- On the `Specify share name` window, for the `Share name:`, enter `Sales`. Click `Next >`.

- On the `Configure share settings`, check `Enable access-based enumeration` and leave `Allow caching of share` checked. Click `Next >`.

- On the `Specify permissions to control access`, click `Customize permissions...`.

  - On the `Advanced Security Settings for Sales` window, do the following:

    - Click `Add`.

    - On the `Permission Entry for Sales` window, `Select a principal`, enter `Sales`, click `Check Names`, then click `OK`.

    - Check `Write`, click `OK`.

The `Sales` group is now added to the `Permission entries` list.

You never want to assign single users to a resource. We always want to assign groups to resources. This allows us to more efficiently manage permissions.

- Click `Disable inheritance`, pick `-> Convert inherited permissions into explicit permissions on this object.`

- Remove both `Users (GOODCORP\Users)` permissions. The only ones left should be: `Administrators`, `SYSTEM`, `CREATOR OWNER`, and `Sales (GOODCORP\Sales)`.

Understand that not all domain users won't be able to access this share and that only users in the `Sales` group can.

- Click `Apply` and `OK` to exit the `Advanced Security Settings for Sales` window.

- Click `Next >`.

- On the `Confirm selections` screen, click `Create`.

- Click `Close` after it's done creating.

We have now created a shared folder called `Sales` that we can access from our Windows 10 VM as `Bob`.

Next, let's check the `Access Control List` of the file share.

#### Checking `Access Control Lists` and `Security Identifiers`

If we wanted to look at the group SIDs Bob is associated to, we would use the following command:

- Type `Get-ADPrincipalGroupMembership -Identity Bob | Format-Table -Property Name, SID`.

This command will get the (security) principal's, or in our case, `Bob`'s group membership information from AD, which we'll then format by `Name` and `SID`.

- Run the command and check out the output:

  - **Student Note**: yours will be different

  ```PowerShell
  Name         SID
  ----         ---
  Domain Users S-1-5-21-1631281936-2151775305-3445712239-513
  Sales        S-1-5-21-1631281936-2151775305-3445712239-2109
  ```

These are the two groups the user `Bob` is in.

Notice that the `Sales` group RID is `2109`.

Let's check the access control list for the new file share.

- Type `Get-ACL \\(your-AD-computer-name)\sales | Format-List` and explain that we should see a list of permitted SIDs under `Sddl`, or `Security Descriptor Definition Language`.

- Run the command and point out the output:

  ```PowerShell
  Path   : Microsoft.PowerShell.Core\FileSystem::\\(your-AD-computer-name)\sales
  Owner  : BUILTIN\Administrators
  Group  : GOODCORP\Domain Users
  Access : CREATOR OWNER Allow  FullControl
         NT AUTHORITY\SYSTEM Allow  FullControl
         BUILTIN\Administrators Allow  FullControl
         GOODCORP\Sales Allow  Write, ReadAndExecute, Synchronize
  Audit  :
  Sddl   : O:BAG:DUD:PAI(A;OICIIO;FA;;;CO)(A;OICI;FA;;;SY)(A;OICI;FA;;;BA)(A;OICI;0x1201bf;;;S-1-5-21-1631281936-2151775305-3445712239-2109)
  ```

Notice that the `Access` to `GOODCORP\Sales` and matching RID, `2109`.