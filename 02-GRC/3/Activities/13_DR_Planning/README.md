## Activity: Disaster Recovery Planning For GeldCorp

### Instructions

In this exercise, you'll develop a high level DR plan for *Geldcorp.* The DR plan should be focused on the network and technology domains of the business, and will be for situations where the business suffers a catastrophic incident that must be contained before operations can continue.  

When thinking about the DR plan, assume that a major disruption has occurred and led to the loss of the main data and tech center for the company. 

Use the below information about *GeldCorp* along with the information about GeldCorp from the [Threat Modeling exercise](<https://github.com/coding-boot-camp/Cybersecurity-Lesson-Plans/blob/v2-GRC/1-Lesson-Plans/02-GRC/2/Activities/01_Threat_Modeling_Steps_1_4/Unsolved/README.md>). Read it thoroughly. It is up to you to determine which pieces are relevant for your specific planning. 

### About GeldCorp

**Physical Environment**

- All office buildings have one main door and two secondary (back) doors.
- Each door has card access, but *GeldCorp* still experiences occasional tailgating.
- Servers at the data centers are in the main floor of each office, which is accessible from all wings of the building.

**Personnel**

- Aside from security culture training, none of the employees have any exposure to information security.

- Technical employees and executives sometimes work remotely.

- Technical employees and executives are given Administrator accounts by default.

- Employee turnover is high.

**Network**

- *GeldCorp* has both wired and wireless networks.

- Visitors can connect to the guest network at the office. Employees often use this network.

- Employee workstations and laptops have VPN access to the corporate intranet.

**Technology**

- The company buys hardware and software and deploys them with default configurations.

- Some software applications are built internally by an in-house software development team.

- Each site on the corporate intranet requires employees to login, and sometimes different internal sites require a different login credentials.

- The company has experienced consistent virus and malware infections, due largely to phishing attacks.

- The company allows employees to connect their own devices to the office wireless networks.

**Security**

- *GeldCorp* has yet to implement your formal security policy recommendations. Currently, they have none.

- The company has experienced DDoS attacks in the past.

- No formal process exists for handling field issues or security incidents.


### Activity Deliverables 

**Policy Statement** (1-2 paragraphs) 

- First, detail how the business would be affected in the event of a disastrous threat.

- What are the main objectives of the Disaster Recovery plan for *GeldCorp*?

**Plan Overview**

Indicate the following. You do not need to do a thorough BIA analysis, so be creative using what we have learned so far about *GeldCorp*.
- MTD for information systems.
- RTO for information systems.
- RPO for information systems (i.e frequency of data and other systems backup) 

- What are the backup strategies that should be implemented? 

Also include necessary details for at least one of the following that senior management will need to be aware of. What should the activation procedures be? 
  - Cold Site 
  - Warm Site 
  - Hot Site 

Explain how the business should prioritize its resources to recover from the reputation and operational damage of a catastrophic loss. Include any other people from the company you feel should be involved in this.

**Plan Implementation and Testing**

- What will you need to do to implement your Disaster Recovery plan. Who are the relevant stakeholders who should be involved? 

- Consider specifically how you will train your employees and how you will test critical details of the plan.

- Leverage your learnings in developing a training plan for the Security Culture Framework exercises to help inform training and implementation for your DR plan.