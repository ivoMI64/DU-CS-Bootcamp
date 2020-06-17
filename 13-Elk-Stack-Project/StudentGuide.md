## 13.1-13.3 Student Guide: ELK Stack Project Week 

### Overview

This week, you will set up a cloud monitoring system by configuring an ELK stack server. 

### Week Objectives

You will use the following skills and knowledge to complete the following project steps: 

- Deploying containers using Ansible and Docker.
- Deploying Filebeat using Ansible.
- Deploying the ELK stack on a server.
- Diagramming networks and creating a README.

**Note:** While you must complete your projects individually, you can work through problems together, and should ask instructional staff for help if you get stuck.

### Week Overview 

#### Day 1: Configuring an ELK Server
On Day 1, we will:
  - Review the overall project and suggested milestones for each day. 
    - Note that these milestones are only suggested. If you need extra time on the project, you can continue your work during the second project week in the course. 

  - Complete Day 1 activities:
    1. Create a new VM in Azure.
    2. Add the new VM to Ansible’s `hosts` file.
    3. Create an Ansible playbook that installs Docker and configures the container.
    4. Run the playbook to launch the container.
    5. Restrict access to the ELK VM.

#### Day 2: Filebeat
On Day 2, we will:
   - Briefly discuss Filebeat before starting activities.

- Complete Day 2 activities:
    1. Navigate to the ELK server’s GUI to view Filebeat installation instructions.
    2. Create a Filebeat configuration file.
    3. Create an Ansible playbook that copies this configuration file to the DVWA VMs and then installs Filebeat.
    4. Run the playbook to install Filebeat.
    5. Confirm that the ELK stack is receiving logs.
    6. Install Metricbeat as a bonus activity. 

#### Day 3: Exploration and Diagramming
On Day 3, we will:
- Continue and complete the Filebeat activity, draft a network diagram, and complete a README. 

### Lab Environment

You will continue using your personal Azure account and build upon your existing Azure VMs. You will **not** be using your cyberxsecurity accounts. 

### Additional Resources
- [Ansible Documentation](https://docs.ansible.com/ansible/latest/modules/modules_by_category.html)
- [`elk-docker` Documentation](https://elk-docker.readthedocs.io/#Elasticsearch-logstash-kibana-elk-docker-image-documentation)
- [Virtual Memory Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html) 
- ELK Server URL: http://your-IP:5601/app/kibana#/home?_g=()
- [Docker Commands Cheatsheet](https://phoenixnap.com/kb/list-of-docker-commands-cheat-sheet)

### Slideshow

The slideshow to this week is located on Google Drive here: [ELK Stack Project Week (13) Slides](https://docs.google.com/presentation/d/1b0jbp5L_ws2iCFuOSnU7BfoXb6oSiWccqmwXKk8yJ0w/edit#slide=id.g4789b2c72f_0_6)


---
## Day 1: Configuring an ELK Server

### Project Week Overview  

- The purpose of project week is to provide an opportunity to combine everything you've learned in order to create and deploy a live security solution.

- The course includes three projects in total. Two more will come later, in which you will expand on what you create this week, building an increasingly sophisticated skillset and portfolio.

This week, you will deploy an ELK monitoring stack within your virtual networks. This will allow you to monitor every machine on the network.

In particular, the ELK stack allows analysts to:
- Easily collect logs from multiple machines into a single database.

- Quickly execute complex searches, such as: _Find the 12 internal IP addresses that sent the most HTTP traffic to my gateway between 4 a.m. and 8 a.m. in April 2019._

- Build graphs, charts, and other visualizations from network data.

At the end of the week, you will have a fully functional monitoring solution, live on the cloud.

This will be a major achievement for a few reasons:
- Deploying, configuring, and using an ELK stack is a common task for network engineers, SOC analysts, and other security professionals. Completing this project will be proof of your skills, which you can present to hiring managers.

- The ELK stack is very commonly used in production. You will likely work for organizations that use either ELK or Splunk, covered later in the course. Experience with both is a great addition to a job application.

- You can expand this network with additional machines on your own time to generate a lot of interesting log information. This sort of independent research is useful for learning, and hiring managers love to see it. 

Finally, the amount you have learned in order to complete this project, including systems administration, configuration as code, virtualization, and cloud deployment, is substantial. Congratulations on making it this far.

#### Deliverables 
As you work through the project, you will develop the following "deliverables" that you can take with you and discuss at job interviews:

- **Network diagram**: This document is an architecture diagram describing the topology of your network.

- **Technical brief**: Answers to a series of questions explaining the important features of the suite, completed after deploying the stack.

- **GitHub repository**: (This is optional and instructions are provided in this week's optional homework.) After completing the project, you will save your work to a database, called a Git repository, along with an in-depth description of the project. This will make it easy for you to redeploy your work in the future, as well as share it with others.

### Introduction to ELK

We'll cover what the ELK stack can do and how it works before you begin deploying it. You should be familiar with ELK from previous units.  

ELK is an acronym. Each letter stands for the name of a different open-source technology:
- **Elasticsearch**: Search and analytics engine.

- **Logstash**: Server‑side data processing pipeline that sends data to Elasticsearch.

- **Kibana**: Tool for visualizing Elasticsearch data with charts and graphs.

ELK started with Elasticsearch. Elasticsearch is a powerful tool for security teams because it was initially designed to handle _any_ kind of information. This means that logs and arbitrary file formats, such as PCAPs, can be easily stored and saved.

- After Elasticsearch became popular for logging, Logstash was added to make it easier to save logs from different machines into the Elasticsearch database. It also processes logs before saving them, to ensure data from multiple sources has the same format before it is added to the database.

- Since Elasticsearch can store so much data, analysts often use visualizations to better understand the data at a glance. Kibana is designed to make it easy to visualize massive amounts of data in Elasticsearch, and it is well known for its complex dashboards.

In summary:
- Elasticsearch is a special database for storing log data.
- Logstash is a tool that makes it easy to collect logs from any machine.
- Kibana allows analysts to easily visualize their data in complex ways.

Together, these three tools provide security specialists with everything you need to monitor traffic in any network.

#### The Beats Family

The ELK stack works by storing log data in Elasticsearch with the help of Logstash.

Traditionally, administrators would configure servers to collect logs using a built-in tool, like `auditd` or `syslog`. They would then configure Logstash to send these logs to Elasticsearch.

- While functional, this approach is not ideal because it requires administrators to collect all of the data reported by tools like `syslog`, even if they only need a small portion of it.

  - For example, administrators often need to monitor changes to specific files, such as `/etc/passwd`, or track specific information, such as a machine's uptime. In cases like this, it is wasteful to collect all of the machine's log data in order to only inspect a fraction of it.

Recently, ELK addressed this issue by adding an additional tool to its data collection suite called **Beats**.

- Beats are special-purpose data collection modules. Rather than collecting all of a machine's log data, Beats allow you to collect only the very specific pieces you are interested in.

ELK officially supports eight Beats. You will use two of them in this project:
- **Filebeat** collects data about the file system.
- **Metricbeat** collects machine metrics, such as uptime.

  - A **metric** is simply a measurement about an aspect of a system that tells analysts how "healthy" it is. Common metrics include:
    - **CPU usage**: The heavier the load on a machine's CPU, the more likely it is to fail. Analysts often receive alerts when CPU usage gets too high.

    - **Uptime**: Uptime is a measure of how long a machine has been on. Servers are generally expected to be available for a certain percentage of the time, so analysts typically track uptime to ensure their deployments meet service-level agreements (SLAs).

 Metricbeat makes it easy to collect specific information about the machines in the network. Filebeat enables analysts to monitor files for suspicious changes.

You can find documentation about the other Beats at the official Elastic.co site: [Getting Started with Beats](https://www.elastic.co/guide/en/beats/libbeat/current/getting-started.html).

### Project Setup
 The goal of this project is to add an instance of the ELK stack to the virtual networks you created during the cloud security unit.

- Make sure that you are logged into your personal Azure accounts and not cyberxsecurity. You will be using the VMs you created during the week on cloud security.

Since you will be building off of that week, let's take a moment to review the network architecture built in that unit.

![Cloud Network](Images/Cloud-Diagram.png)

This network contains:

- A gateway. This is the jump box configured during the cloud security week. 

- Three additional virtual machines, one of which is used to configure the others, and two of which function as load-balanced web servers.

The goal of this project is to add a machine running the ELK stack to this network so you can monitor the health of your entire deployment.


In order to set this up, you will perform the following steps:
1. Create a new VM within the network.
2. Download and configure an ELK stack Docker container on the new VM.
3. Install Filebeat and Metricbeat on the other machines on the network.

You will use Ansible to automate each configuration step.

At the end of the project, you will be able to use Kibana to view dashboards visualizing the activity of your network.

You will install an ELK container on the new VM, rather than setting up each individual application separately.

- Before containers, we would not have been able to do this. We would have had to separately configure an Elasticsearch database, a Logstash server, and a Kibana server, wire them together, and then integrate them into the existing network. This would require at least three VMs, and definitely many more in a production deployment.

- Instead, now you can leverage Docker to install and configure everything all at once. This is considered best practice and is one of the major advantages of containers.

Remember, you took a similar approach when creating an Ansible control node within the network. You installed an Ansible container rather than installing Ansible directly. This project uses the same simplifying principle, but to even greater effect.

#### References

- More information about ELK can be found at [Elastic: The Elastic Stack](https://www.elastic.co/elastic-stack).
- More information about Filebeat can be found at [Elastic: Filebeat](https://www.elastic.co/beats/filebeat).
- To set up the ELK stack, we will be using a Docker container. Documentation can be found at [elk-docker.io](https://elk-docker.readthedocs.io/).

### Day 1 Activity: ELK Installation

- [Day 1 Activity File: ELK Installation](Activities/Stu_Day_1/Unsolved/ReadMe.md)
- [Day 1 Resources](Activities/Stu_Day_1/Unsolved/Resources/)

---

## Day  2: Filebeat

### Filebeat Overview 

On Day 2, you will continue working the installation of the ELK server. At this point, you have completed the installation of the ELK server, and will now move onto installing **Filebeat**. 

Remember, Filebeat helps generate and organize log files to send to Logstash and Elasticsearch. Specifically, it logs information about the file system, including when and which files have changed.

- Filebeat is often used to collect log files from very specific files, such as those generated by Apache, Microsoft Azure tools, the Nginx web server, and MySQl databases.

- Since Filebeat is built to collect data about specific files on remote machines, it must be installed on the VMs that you want to monitor. 

- You will install Filebeat on the DVWA container you created during the cloud security week, which will provide a rich source of logs when your deployment is complete.

After installing Filebeat, you will install Metricbeat.

- Installing Filebeat is required. If you run out of time, you can skip Metricbeat.

**Note**: Visit the [Elastic website ](https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-modules.html) for information on Filebeat modules. 

### Day 2 Activity: Filebeat Installation

- [Day 2 Activity File: Filebeat Installation](Activities/Stu_Day_2/Unsolved/ReadMe.md)
- [Day 2 Resources](Activities/Stu_Day_2/Unsolved/Resources/)

**Note:** The Resources folder includes an `ansible.cfg` file. You don't need to do anything with this file. It's included in case you accidentally edit or delete your configuration file.

---

## Day 3: Exploration and Diagramming 

On Day 3, if you need more time installing Filebeat on your DVWA machines, you can continue this work. If you have finished the Filebeat installation, you can move on to create your network diagrams and project READMEs.

### Day 3 Activity: Network Diagramming and README

- [Day 3 Activity File: Network Diagramming and README](Activities/Stu_Day_3/Unsolved/ReadMe.md)

---

## Congratulations! 

Congratulations on making it to the end of the first project week, and on all the work you've done for the past 13 weeks. 

You should make sure your projects are complete, professionally presentable, and free of errors. You can use these resources as proof of knowledge and experience in the hiring process. 

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  