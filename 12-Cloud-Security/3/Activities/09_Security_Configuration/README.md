## Activity File: Security Configuration

- Previously, you configured a DVWA VM from your jump box VM and placed it behind a load balancer. At this time, you still cannot access the DVWA site from the internet.

- In this activity, you will continue with the setup of this training environment and allow DVWA to be reached from the internet.

- Your task is to configure the load balancer and security group to work together to expose port `80` of the VM to the internet.

### Instructions

1. Create a load balancing rule to forward port `80` from the load balancer to your Red Team VNet.

    - Set **Session persistence** to **Client IP and protocol**.

2. Create a new security group rule to allow port `80` traffic from the internet to your internal VNet.

3. Verify that you can reach the DVWA app from your browser over the internet.

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
