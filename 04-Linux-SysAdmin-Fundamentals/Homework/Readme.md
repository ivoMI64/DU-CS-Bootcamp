## Homework : Linux Week 1

### Background

In the previous class activities, you acted as system administrator in order to troubleshoot a malfunctioning server.

The senior administrator was quite pleased with your work. Now, they would like you to prepare another server to replace this server. You are tasked with completing the  following checklist in order to prepare a new server. 

### Topics Covered in this Activity

- Setting permissions
- Creating user accounts and user groups
- Special bits
- Encrypted passwords
- `tty`
- Tripwire
- Lynis

----

### Instructions:

The administrator has provided a checklist for you detailing all the steps that need to be done.

#### Checklist:

#### Set permissions on sensitive files:
- Set permissions on `/etc/shadow` to allow only `root` read and write access.
- Set permissions on `/etc/gshadow` to allow only `root` read and write access.
- Set permissions on `/etc/group` to allow `root` read and write access, and allow everyone else `read` access only.
- Set permissions on `/etc/passwd` to allow `root` read and write access, and allow everyone else `read` access only.

#### Create user accounts:
- Add user accounts `sam`, `joe`, `amy`, `sara` and `admin`.
- Force users to create 16 character passwords incorporating numbers and symbols.
- Force passwords to expire every `90` days.
- Ensure that only the `admin` has general sudo access.

#### Create user group:
- Add a `engineers` group to the system.
- Add users `sam`, `joe`, `amy`, and `sara` to the managed group.
- Create a shared folder for this group at `/home/engineers`.
- Change the group on the engineers directory to the `engineers` group.
- Add the `GUID` bit _and_ the `sticky` bit to allow collaboration between engineers in this directory.


#### Install and configure `tripwire`. 

Install `tripwire`. 

- Run `sudo apt remove tripwire` to make sure no older versions are installed.

- In order for tripwire to run functionally, we'll want the most updated VM. Run the following commands:

  - `apt update` to update your VM. 

  - `apt upgrade` to upgrade your VM. 

Configure `tripwire`.

- Tripwire comes with a configuration tool called `twadmin`, which you can only run with `sudo`.
	
  - Run `sudo twadmin --help` to see the options you can use with `twadmin`.

- The main policy file for Tripwire is `/etc/tripwire/twpol.txt`. This file is used to let Tripwire know which directories to check.  

- On a production server, we may not want Tripwire to check every single file, so we can exclude files by commenting them out. Configuring Tripwire will require commenting out the `/proc` and `/dev` directories from the `/etc/tripwire/twpol.txt` file.

  - By placing a `#` in front of text, we are telling the system not to read that text as code to be run. Rather, it is ignored and left as plain text writing that is used by humans to leave notes or toggle codes on and off. 
  
- Use the `#` symbol to comment `/proc` and `/dev` underneath ` # Critical Devices` in `/etc/tripwire/twpol.txt`. 
  
- Once you have commented out the `/proc` and `/dev` directories, run the following command to tell Tripwire to use this recreated policy file:
    
  - `sudo twadmin --create-polfile /etc/tripwire/twpol.txt`

Now, we need to create a database of hashes that Tripwire will use to verify our files when we run it. Tripwire creates this database using the policy file as a guide:

- Run the command `sudo tripwire --init` to create the database.

   - Most of the output will be errors and warnings, because we have not yet fully edited the configuration file for our system and use case.

- After the initialization finishes, run `tripwire --check`. Towards the end of this output, you will see a list of all the files that Tripwire tried to check, but couldn't find (because they don't exist on this system).

- Use a compound command to generate a list of these errors and send it to your `/research` directory. Once you have the list of errors, change the `/etc/tripwire/twpol.txt` file to exclude these files from the check.

  <details>
  <summary>Hint</summary>
  <br>
  Fill in the blanks: sudo tripwire --check | ___ -A 3 ^[1-9] __ ~/research/tripwire.txt
  </details>
    
- Each time you makes changes to the policy file, you must re-run `tripwire --init` before you run `tripwire --check`.

- Run `tripwire --check` again and repeat this process until all the errors are resolved.

Tripwire Troubleshooting: Most errors can be resolved by running:
  - `apt remove tripwire`
  - `updating` and `upgrading` all the packages on the system.
  - Re-install Tripwire and start the instructions again.



#### Bonus: Install Tripwire and create a Tripwire user.
- Ensure that the `tripwire` account does not have a home folder.
- Ensure that the `tripwire` account does not have a login shell.
- Ensure that the `tripwire` account is locked.
- Ensure that the `tripwire` account has a UID < 1000.
- Ensure that the `tripwire` account can run the `tripwire` program using sudo.

#### Lynis
- Install and run `lynis`.
- Provide a report from `lynis` output on what more could be done to harden the system.
- **Bonus**: Install and run `chkrootkit` to verify the system does not have a root kit installed.


---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved. 
