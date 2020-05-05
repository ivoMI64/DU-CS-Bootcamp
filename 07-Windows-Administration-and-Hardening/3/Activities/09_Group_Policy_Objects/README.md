## Activity File: Creating Group Policy with Group Policy Objects

For this activity, you are continuing your role as a Windows system administrator managing Active Directory for Good Corp, Inc.
 
Now you need to create Group Policy Objects (GPOs) to enforce policies for users.

 You are tasked with creating a Group Policy Object for the `Sales` organizational unit that removes its access to `Control Panel`. 

### Instructions

1. Navigate to the `Group Policy Management` tool to complete this exercise.

    - The `Group Policy Management` tool is similar to the `Active Directory Users and Computers` tool.

    - If you don't see the `Sales` OU, expand the folders under the `GOODCORP.NET` domain.

2. Name the GPO `No Control Panel`.

3. Right-click the GPO to `Edit...` its policies.

    - Find the policy you need under `User Configuration` > `Policies` > `Administrative Templates` > `Control Panel`. The policy you're looking for is called `Prohibit access to Control Panel and PC settings`. This policy is **not** in a subfolder in `Control Panel`.

    - Set the policy to `Enabled`. Close the `Group Policy Management Editor` window.

4. After you have enabled the policy, link the GPO to the `Sales` OU.  

#### Bonus 

Verify that Bob's account no longer has access to `Control Panel` by doing the following:

1. Log into the Windows 10 machine as 'Bob'. 
- Click on 'Other User' in the bottom left corner. 
- Enter 'bob' for the username and enter his password.
- The machine will take a moment to get setup.

2. Once you're back in the Windows 10 machine, click the `Windows` button in the bottom left and then click the `Settings` icon.

    Nothing should happen. We just used a Group Policy Object to restrict Bob's access on the domain.

14. Attempt to open `Control Panel` in the `Search` field.

    -  Click `Control Panel`. You should see the following warning:

        `This operation has been cancelled due to restrictions in effect on this computer. Please contact your system administrator.`

      This warning indicates that the Group Policy Object was successfully applied. 
      
15. Now, let's authenticate back to our local `Admin` account.

    - Log out of bob's account. `Window Icon > Bob > Sign Out.`

    - For the username, enter `local\Admin`. Use your `Admin` password.

     This means you can use `GoodCorp.net\Bob` to sign into Bob's domain account, and `local\Admin` to sign into the local `Admin` account.

---
 © 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
