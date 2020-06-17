## Activity File:  Virtual Computing

- In previous activities, you set up a secure VNet inside a resource group for the Red Team.

- In this activity, you will launch a new virtual machine to be used as a jump box, a tool used to access the network and configure other machines. 

- To keep connections to this machine secure, you want to only connect using SSH keys.

- You are tasked with setting up a new Ubuntu VM inside the Red Team resource group to be used as a jump box.

### Instructions

Create a new VM. Keep the following in mind when configuring the VM:
- The VM should be named "Jump-Box-Provisioner."

- The VM needs to be in the Red Team resource group.

- The VM should be located in the same region as your other resources.

- The administrative username should make sense for this scenario.

- You will need to create a new SSH key for remote connections.

- Choose the VM option that has:
  - Whose offering is **Standard**
  - 1 CPU
  - 1 RAM
  - 2 Data Disk

In the Networking settings: 

- Make sure your new VM is assigned to your security group.

- Take note of the VM URL. You may use it later.

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
