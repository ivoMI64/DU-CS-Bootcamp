## Activity File: Provisioners

- In the previous activities, you finished setting up a jump box that can only be accessed from your current IP address, using your SSH public key.  

- In this activity, you will continue to set up a testing environment for XCorp's Red Team.

- Instead of accessing this machine from a local machine, you will only access it from inside the container inside your jump box.

- You are tasked with launching a new VM from the Azure portal that can only be accessed using a new SSH key from the container running inside your jump box.

### Instructions

1. Connect to your Ansible container. Once you're connected, create a new SSH key and copy the public key.

2. Return to the Azure portal and create a new VM. Use all the same settings you used on the first VM.

    - Give this VM the name: `DVWA-VM1`.

    - Create a new Availability Set for this machine and name it `RedTeamAS`.

    - Use your container's new public key for the SSH user.

3. After your VM launches, test your connection using `ping` from your jump box Ansible container.

4. Add this machine's internal IP address to the Ansible configuration file.

5. Change the Ansible configuration to use your administrator account for SSH connections.

6. Test an Ansible connection using the appropriate Ansible command.

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved. 