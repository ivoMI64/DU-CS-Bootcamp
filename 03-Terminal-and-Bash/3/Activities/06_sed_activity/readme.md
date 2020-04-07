### Activity File: `sed` Activity   
  
- You continue in your role as security analyst at Wonka Corp.

- Your manager believes there is a new cybercriminal trying, but failing, to log in to several administrative websites owned by Wonka.

- Your manager wants to find out information about this cybercriminal before they end up getting unauthorized access.

- Your manager has provided you with the access logs for two different administrative websites.

- Your first task is to combine the two different access logs into a single file, and then use text processing to make the "failed login" data consistent.

#### Instructions:

Using only the command line, complete the following tasks from within the `/student_day3/learning_sed` folder in your Ubuntu VM:
  
  1. Within this directory are two log files from different administrative websites. 
  
      - Combine the two log files into a single log file called `Combined_Access_logs.txt`.

  3. Failed logins may be titled as "ACCESS_DENIED" or "INCORRECT_PASSWORD."

     - Using `sed`, replace "INCORRECT_PASSWORD" with "ACCESS_DENIED" so the data is consistent.

  3. Save the results into a new file called `Update1_Combined_Access_logs.txt`. 
