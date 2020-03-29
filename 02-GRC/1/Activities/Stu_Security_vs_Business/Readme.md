# Student Do: Weighing Security and Business Objectives 

## Instructions

Welcome! 

In this exercise, you'll play the role of a **Security Consultant** hired to help a financial services firm called _GeldCorp_ decide how risky its business plans are. They've provided a list of plans and want you to explain the security implications of each one and advise which projects they should pursue and which they should cancel.

In addition, they've provided what their security department suggests they should do to make the organization more secure. They've asked that you take a look at these as well and tell them which suggestions are good and which are overkill.

For each suggestion, consider:

- Whether it leads to improved or reduced security;

- Whether the improvement in security is merited. (What are the advantages and why do they matter?);

- How much work will it take to implement;

Then, decide if the business should proceed with the project and justify your verdict.

#### Business Plans

GeldCorp provided the following business plans and security suggestions below:

- The business wants to **give all developers access to all data**. This request was made by the Director of Engineering. She suggests that the free access will help her teams move faster and help her managers cut costs by delegating work more efficiently.

- The Director of IT wants to **make administration servers accessible from public IP addresses**, instead of just from within the corporate subnets. Typically corporate/company networks are not accessible to just anyone on the Internet, and are instead put behind a "gate(way)" which opens only for the right people. The Director of IT argues that that allowing anyone on the Internet to access machines on the company's network will help his administrators, many whom work remote, to connect to the servers they need to manage. He expects this feature to improve retention and hopes to see an uptick in hours on the clock.

- Currently, your company saves emails to several different mail servers. For context, a mail server is just a machine that stores emails. I.e., when you send someone an email, it doesn't go to their computer — it goes to the mail server, where it's stored in a database. Then, when you want to read your emails, you login to the mail server, and it gives you a list of every email it has that was sent to you.

  Your newest SOC Analyst wants to **merge all these email servers into a single database, hosted on a single machine.** She argues that this set-up will improve efficiency by making it easier to monitor the database and save money by reducing the number of machines on the network.  

#### Security Suggestions

- The Director of Security suggested implementing a private, corporate VPN.  A VPN is a gateway that sits between the private corporate network and the Internet. Every time someone tries to access a site on the internal company network, the VPN "tests" the request to see if it's coming from an employee. If it is, it lets it through; otherwise, it doesn't. Since the company has grown to over 300 employees, she argues that it's increasingly critical to ensure confidential information remains hidden. The project would imply significant changes to the company's networking infrastructure, and require onboarding all employees with the VPN. This would mean making sure that everyone has the keys they need to prove they're an employee, so they can access the corporate network from anywhere.The advantage is that the business would have tighter control over communications to/from its core networks.
- The Director of Engineering suggested forcing all developers to use SSH keys instead of passwords to communicate with internal SSH servers. She plans to disable password access in two weeks.
  - Note: We'll cover SSH in a later unit. For now, know that SSH is a way to login to a computer that lives somewhere else and run commands on it. You can login using an SSH password, but because passwords can be cracked, it's preferable to use SSH cryptographic keys to login in via SSH.
- In addition to merging mail servers, your SOC Analyst suggested hardening the server in the following ways:
  - Encrypting all stored emails. For example, assume that a hacker breaks into the mail server and downloads every email on it. This would definitely include sensitive information about projects, finances, etc., which could lead to potentially catastrophic leaks. BUT if the hacker breaks in and downloads encrypted emails, though, they can't really do anything — since the text would look like gibberish, and there would be no way for them to "unscramble" everything, unless they somehow found the encryption key as well. In other words, encrypting the data ensures that hackers can't do anything with it, even if they steal it.
  - Only Allowing Machines on the Corporate Network (or VPN) to Download Mail