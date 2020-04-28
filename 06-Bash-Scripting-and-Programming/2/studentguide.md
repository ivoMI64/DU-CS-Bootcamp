## 6.2: Bash Scripting Continued

### Lesson Overview

Today's class will build on the bash scripting in the context of collecting logs, auditing and reconfiguring a Linux machine, and taking steps to harden the system.

### Lesson Objectives

By the end of class you should be able to:

- Read bash and interpret scripts.

- Use variables in their bash scripts.

- Use IF statements in their bash scripts.

- Use lists in their bash scripts.

- Iterate through lists with a for loop to do useful things like install a list of packages.


### Lesson References

- [Bash Cheat Sheet](https://gist.github.com/LeCoupa/122b12050f5fb267e75f)
- [100 Shell Script Examples](https://github.com/epety/100-shell-script-examples)

### Slide Show

The slides for today can be viewed on Google Drive here: [Linux 3 Day 2 Slides](https://docs.google.com/presentation/d/1EyPKGcG4zGI2tnhR33V7SH30B3IEyYFSxXlF81pczYg/edit).


---

### 01. If Statements and Exit

Today we are on the second day of bash scripting and will make our scripts a bit more sophisticated. By the end of class, you will have two bash scripts that can be used on your own machines in the future.

Scripting plays an important in many cybersecurity roles:

- Sysadmins use them to setup and configure machines.
- Forensics use them for investigations.
- Pen testers use them to probe networks and find vulnerabilities.

These tasks and others require advanced bashing skills. Today, we'll continue to develop our scripting skills in order to incorporate the following into our script:

- `if` statements and the decision making based on criteria.

- `for loops` to complete repetitive tasks.

- Automating the set up of a machine.

#### Criteria and Decision Making

First, we will need our scripts to make decisions based on specific criteria.

  - For example, our scripts can check for the users, directories, files or permissions. Based on the results, the script can then take specific action or even stop its execution.

In order to accomplish this feature, we will need to learn a few useful scripting techniques:

- Using `if` statements.
- Using `if/else` statements.
- Comparing multiple tests using `if/else` statements.

`if` is used in our scripts as part of a **conditional** statement. Based on a specific condition (or criteria), the script will take a certain action.

- _If this command runs, then exit the script_.

- _If this file exists, then run that command_.

Next, we'll run through a few examples of if statements in the demo.

- In this demo, we will also encounter **comments** and the `exit` command, which will be explained as they pop up.


#### `if` Demonstration

Log into the lab environment with the username `sysadmin` and password `cybersecurity`.

- Open a terminal.

- Open the script `if_exit.sh` using nano.

- Run `nano if_exit.sh`.

Walkthrough the script, starting with the comments at the top of the script.

- **Comments** are non-executable text within the script.

- These comments can help the users remember what their script is supposed to do when they read it later.

- Commenting a script is good practice and should be regularly used to notate what the script is doing.

In order to create a comment, we place a `#` in front of any line we want to be a comment. Once `#` is place inform of the line, bash will ignore this line.

- When lines are ignored by bash because of comment symbols, we say those lines are **commented out**.

Write another comment.

- Type: `# this is a comment.`

Next, move onto `if` statement syntax.

The syntax of bash `if` statements works as follows:

  ```bash
  # if [ <test> ]
  # then
  #   <run_this_command>
  #   <run_this_command>
  #   <run_this_command>
  # fi
  ```

Break down the syntax:

- `if`: initiates our if statement.

- `[]`: encapsulates the condition.
- `then`: runs following commands _if_ the condition is met.
- `fi`: ends the if statement.


#### `if` / `else`

Sometimes, if the condition is not met, we will want the script to do something else.

- For these scripts, we can use `else`.

Show the following statement:

```bash
# if [ <test> ]
# then
#   <run_this_command>
# else
#   <run_this_command>
# fi
```

Break down the syntax:

- `if [ <test> ]`: if this test is true...

- `then`: run the following commands.
- `else`: if `[ <test> ]` is false, the run the following command.
- `fi`: ends the if statement.

#### Combining Tests with `&&` and `||`

We can check for more than one condition using the `&&` (and) and `||` (or) operators.

If both conditions need to be true, we can use the "and" condition, indicated by the `&&`.

- If both tests are true, then run the command.

- Remember: this is exactly how the `&&` works when we use it to chain commands together in the last class. The second command only runs if the first command is completed.

- In other words, _if_ the first command completes, then the system sees that as a 'true' and _then_ it moves onto the second command.

For this next example, both `[tests]` have to be true in order for the following commands to run.

```bash
# if [ <test1> ] && [ <test2> ]
# then
#   <run_this_command>
#   <run_this_command>
#   <run_this_command>
# fi
```

If only one of the two (or more) conditions need to be met, then we can use the OR condition, indicated by the `||` symbol.

For this example, only [test1] or [test2] needs to be true.

```bash
# if [ <test1> ] || [ <test2> ]
# then
#   <run_this_command>
#   <run_this_command>
#   <run_this_command>
# else  
#   <run_this_command>
# fi
```

Break down the syntax:

- `if [ <test1> ]`: If this test is true...

- `|| [ <test2> ]`: ...or this test is true...
- `then`: then run the following commands.
- `else`: otherwise (if both conditions are false), run the following command.
- `fi`: ends the if statement.


#### Creating Conditions

Now, we'll cover how to design the tests (conditions) that are ruled `true` or `false` in conditional statements.  If the test is true, the commands run. If the test is false, the commands do not run.

In the following examples, we will create tests that compare numerical values and strings. For these comparisons, we will use the following numerical variables(`x` and `y`) and the string variables (`str1` and `str2`):

```bash
# set num variables
x=5
y=100

# string variables
str1='this is a string'
str2='this is different string'
```


We will compare these variables using the following bash conditional expressions:

- `=` : Checks if two items are `equal`.

- `!=` : Checks if two items are `not equal`.

- `-gt` : Checks if one integer is `greater than` another.

- `-lt` : Checks if one integer is `less than` another.

- `-d /path_to/directory` : Checks for existence of a directory.

- `-e /path_to/file` : Checks for existence of a file.

#### Equals To and Not Equals to

First, we will cover `=`, `equals to`.

```bash
# If $x is equal to $y, run the echo command.
if [ $x = $y ]
then
  echo "X is equal to Y!"
fi
```

Break down the syntax:

- `if [ 5 = 100 ]`: If 5 is equal to 100...

- `then`: then, run the following command.
- `echo "X is equal to Y!"` The echo command that will run if the initial condition is met.
- `fi` ends the `if` statement.

Note, this conditional _can_ actually be run as `[ 5 -eq 100 ]`, we are using variables for the example.

If we wanted this test to return true, we can change `=` to `!=`, which stands for 'not equal to'.

```bash
# If x is not equal to y, exit the script
if [ $x != $y ]
then
  echo "$x does not equal $y"
fi
```

Break down the syntax:

- `if [ 5 != 100 ]`: If 5 is not equal to 100...

- `then`: then run the following commands.
- `echo 5 does not equal 100`: The command that is run.
- `fi`: end the `if` statement.

We can also use `=` and `!=` to compare strings.

- In this example, we will use the **`exit` command** to stop the script if the test is true.



```bash
# If str1 is not equal to str2, run the echo command and exit the script.
if [ $str1 != $str2 ]
then
  echo "These strings do not match."
  echo "Exiting this script."
  exit
fi
```

Break down the syntax:

- `if [ $str1 != $str2 ]`: If `$str1` is not equal to `$str2`...
- `then`: Then run the following command.
- `echo "These strings do not match.` ; `echo "Exiting this script."` Run these commands.
- `exit`: Stop running this script, if the condition is true (which it is).

    - `exit` will stop the script at the point at which it is placed in the script.
    - `exit` is commonly used depending on the outcome of a decision.
- `fi`: closes out `if` statement

#### Greater Than and Less Than

Next, we will cover the `-gt` (greater than) and `-lt` (less than) conditions.

In this example, if `x` is greater than `y`, then we will run an echo script.

```bash
# If x is greater than y, run the echo command
if [ $x -gt $y ]
then
  echo "$x is greater than $y".
fi
```

Break down the syntax:

- `if [ $x -gt $y ]`: If `x` is greater than `y`

- `then... echo "$x is greater than $y":` Then, run the echo command.

In this next example, if `x` is less than `y`, it will run an echo script. If the statement is false, then there is an `else` condition that will run a different echo command.

```bash
#check if x is less than y
if [ $x -lt $y ]
then
  echo "$x is less than $y!"
else
  echo "$x is not less than $y!"
fi
```

Break down the syntax:

- `if [ $x -lt $y ]`: if `$x` is less than `$y`...

- `then`: Then run the following command.
- `echo "$x is less than $y!"`: run this echo command is the statement is true.
- `else`: Otherwise, run the following command.
- `echo "$x is not less than $y!"` run this echo command if the statement is false.


We can also use greater than or less than conditions to compare strings.

In the next example, we'll combine that feature with some other conditions.

```bash
# check if $str1 is equal to 'this string' AND $x is greater than $y
if [ $str1 = 'this string' ] && [ $x -gt $y ]
then
  echo "Those strings match and $x is greater than $y!"
else
  echo "Either those strings don't match, or $x is not greater than $y"
fi

# check if $str1 is equal to str2 OR $x is less than $y
if [ $str1 != $str2 ] || [ $x -lt $y ]
then
  echo "Either those strings don't match OR $x is less than $y!"
else
  echo "Those strings match, AND $x is not less than $y"
fi
```

Breakdown:

- `if [ $str1 = 'this string' ] && [ $x -gt $y ]`:

    - If the string inside the variable `str1` is equal to `this string` **and** `$x` is greater than `$y`, then run the following echo command . Otherwise, run a different echo command.

- `if [ $str1 != $str2 ] || [ $x -lt $y ]`
    - If `$str1` does not equal `$str2` **or** `$x` is less than `$y`, then run the following echo command. Otherwise, run a different echo command.

#### Checking Files and Directories as part of Conditional Statements

 Now, we will cover how to check for files and directories using the following options:  

- `-f` to check for files.

- `-d` to check for directories.

In the following examples, we will check if the following directories and files exist. If they do, they we will print echo commands.

```bash
# check for the /etc directory
if [ -d /etc ]
then
  echo The /etc directory exists!
fi

# check for my_cool_folder
if [ ! -d /my_cool_folder ]
then
  echo my_cool_folder isn\'t there!
fi

# check for my_file.txt
if [ -f /my_file.txt ]
then
  echo my_file.txt is there
fi
```

Syntax breakdown:

- `if [ -d /etc ]...`:

    - If the `/etc` directory exists, run the following echo command.

- `if [ ! -d /my_cool_folder ]...`:

    - If `/my_cool_folder` does not exist, run the following echo command.

- `if [ -f /my_file.txt ]...`:

    - If the file `/my_file.txt` exists, then run the following echo command.

These arguments can be very useful for checking files and folders before you create or remove them.

#### Built-In Variables and Command Expansions

Lastly, we can use built-in variables and command expansions inside our tests.

In the following three examples, we will use these variables and command expansions to check if:

- Specific users are sysadmin users;

- The UID of a user is specific to a certain value;

- The sysadmin is the user that is running the current script.


```bash
# if the user that ran this script is not the sysadmin user, run the echo command
if [ $USER != 'sysadmin' ]
then
  echo you are not the sysadmin!
  exit
fi
```

Syntax breakdown:

- `if [ $USER != 'sysadmin' ]`: If the user that ran this script is **not** the sysadmin user, then run the following echo command.

```bash
# if the uid of the user that ran this script does not equal 1000, run the echo command
if [ $UID -ne 1000 ]
then
  echo your UID is wrong
  exit
fi
```

Syntax breakdown:

- `if [ $UID -ne 1000 ]`: If the `uid` of the user that ran this script does not equal `1000`, then run the following echo command.


```bash
# if the sysadmin ran the script, run the echo command
if [ $(whoami) = 'sysadmin' ]
then
  echo 'you are the sysadmin!'
fi
```

Syntax breakdown:

- `if [ $(whoami) = 'sysadmin' ]`: If the sysadmin ran the script, then run the following echo command.


### 02. Variables and If Statements

- [Lists and Loops Activity](Activities/06_STU_Lists_and_Loops/Unsolved/Readme.md)

### 03. Variables and If Statements Review

- [Solution Guide](Activities/06_STU_Lists_and_Loops/Solved/Readme.md)


### 04. Lists and Loops (0:20)

Throughout the past two days, we have been optimizing our scripts with combined commands and conditional statements.

- Each of these tools simplifies and expiates the day to day workload of sys admins.

- In this next section, we will continue to streamline daily practices by  incorporating iterative commands known as for loops into our script.

System administrators will often complete the same common tasks over and over again.

- For example: A sysadmin might need to run through all the user on a system and checking the last time they reset their password.

Rather than completing this tasks one by one for each user, we can streamline our script with `for loops`, to run through the same command (checking the last password reset) for each user.

An introduction to `for loops`:

- A **`for loop`** allows us to run a block of code multiple times in a row, without having to repeatedly type out that code.   

- The code is run against a **list** that holds the items in the code block.  

- The `for loop` run for as many times as there are items on the loop.


In the previous example of the sysadmin checking the passwords of each user:

- The code to check the last time the passwords were reset would be the block of code.

- The users would be the items in the list.

- If there are 100 users, the for loop will run the code 100 times, checking the last password reset for each user.  

This process of repeating code with a new item each time it is run is called **iteration**.


#### Lists and `for loops` demonstration

In the next walkthrough, we will create a list and use `for loop`.

- Log into the lab environment with the username `sysadmin` and password `cybersecurity`.

- Open the terminal.

Before we start creating loops, we will need to create a list to use.

Bash has several ways to create lists. We are going to cover:

- Manually
- Command Expansion
- Brace Expansion

#### Manually Creating Lists

We will create a list by simply typing the items inside of a `( )`.

- Type: `(a b c d e)`.

- If you are used to writing in other languages, note that in bash, there are no `,` in between list items.

Next, we will need to save this list to a variable.

- Run: `my_list=(a b c d e f)`

Now, we will use echo to access the items in our list using the following syntax:

- `echo ${mylist[0]}`

Syntax breakdown:

- `{}`: In bash, we need surround the list with `{}`.

- `[0]`: Each item in the list is assigned a number, known as an **index**. The number assignment always starts at 0.

- In order access the item, we use `[]` with the index inside of it.

We will also place the `@` inside the brackets in order to access _all_ the items.

Provide some examples:

- Run: `echo ${my_list[0]}`

- Run: `echo ${my_list[4]}`

- Run `echo ${my_list[@]}`

Your output should be:

```bash
$ echo ${my_list[0]}
a
$ echo ${my_list[4]}
e
$ echo ${my_list[@]}
a b c d e f
```

Another example:

- Run: `my_list=('mon' 'tues' 'wed' 'thurs' 'fri')`

- Run: `echo ${my_list[0]}`

- Run: `echo ${my_list[4]}`

- Run `echo ${my_list[@]}`

Your output should be:

```bash
$ echo ${my_list[0]}
mon
$ echo ${my_list[4]}
fri
$ echo ${my_list[@]}
mon tues wed thurs fri
```

Syntax Breakdown:

- `$`: Used to access the variable.

- `{}`: Tells bash that the variable is a list.
- `my_list`: The variable for our list.
- `[0]`: Indicated which item in the list we want to access. The items within the bracket beginning at zero moving from left to right in the list.
- `@`: Used to access all the items.

#### Command Expansion

We can also specify expansions in place of a list.

We are already familiar with command expansions like `$(ls)` which will return a list of files.

- Run: `echo $(ls)`

- Your output should be a list of files.

When we use command expansion, we can't access the items individually using the `[]` syntax, but we will see that we can access them with a loop in a few moments.

Another way to get a list is with `brace` expansion. Brace expansion will give you a list numbers if you need them.

Run: `echo {0..5}`

Your output should be:

```bash
$ echo {0..5}
0 1 2 3 4 5
```



#### Loops Syntax

In this next demonstration, we will incorporate a list into a for loop.

First, we'll cover the syntax of `for loops`.

- Open the script named `ins_for_loops.sh`

- Run `nano ins_for_loops.sh`

Output should be:

```bash
# for <item> in <list>;
# do
#   <run_this_command>
#   <run_this_command>
# done
```
Break down the syntax:

- `for` initiates the `for` loop.

- `<item>` is a variable that holds each item in the list, one by one as the loop repeats. "item" can be named anything you want. `item` is common. `index` is common. or even just `i`.

- `in <list>` represents each item in the list.

- `;` the initial statement always closes with a `;`

- `do` run the commands that follow.

- `done` end our `for` loop.

#### For loops examples:

Now we we will take a look at a few examples.

First let's make a list:

```bash
# list variables
months=(
    'january'
    'february'
    'march'
    'april'
    'may'
    'june'
    'july'
    'august'
    'september'
    'october'
    'november'
    'december'
)
days=('mon' 'tues' 'wed' 'thur' 'fri' 'sat' 'sun')
```

If you have a really long list, you can use this syntax where each list item is on it's own line.

In the first example, we have a for loop that will print out


```bash
#print out months
for month in ${months[@]};
do
    echo $month
done
```

Syntax breakdown:

- `for` starts off our loop.

- `month` is our variable that will hold each string in the list of $months.
- `in ${months[@]}` represents every string in the list of months.
- `;` close the opening statement.
- `do` run the commands that follow
- `echo $month` run this echo command. Each time the loop runs, the `$month` variable holds the value of a different list item.
`done` close out our for loop.

Can you take a swing at interpreting what this code block?

```bash
#print out the days of the week
for day in ${days[@]};
do
    if [ $day = 'sun' ] || [ $day = 'sat' ]
    then
        echo "It is $day. Take it easy."
    else
        echo "It is $day. Get to work!"
    fi
done
```

Syntax breakdown:

- `for day in ${days[@]}` for every item in the list of days.

- `do` run the commands that follow.
- `if [ $day = 'sun' ] || [ $day = 'sat' ]` _if_ the $day equals sat or the $day equals sunday.
- `then` run the command that follows.
- `echo "It is $day. Take it easy."` run this echo command.
- `else` _Otherwise_ run a different command.
- `echo "It is $day. Get to work!"` run this command.
- `fi` close our if statement.
- `done` close our `for` loop.

In the next examples, we can use command expansion or brace expansion directly in place of the list:

```bash
# run a command on each file
for file in $(ls);
do
    ls -lah $file
done
```

Syntax breakdown:

- `for file in $(ls);` first, run the command `ls` to get a list. Then, for each item in that list.

- `do` the commands that follow.
- `ls -lah $file` run this command. Every time the loop comes around, `$file` will represent a different item from the list returned by the `ls` command.
- `done` closes out our `for` loop.

The final block:

```bash
# run an operation on each number
for num in {0..5};
do
    if [ $num = 1 ] || [ $num = 4]
    then
      echo $num
    fi
done
```

Be sure to cover each part of the syntax:

- `for num in` kicks off our `for` loop with a `num` variable.

- `{0..5}` _expands_ into a list: (0 1 2 3 4 5).
- `do` run these commands for each item in the list.
- `if [ $num = 1 ] || [ $num = 4]` _if_ the number is 1 or the number is 4.
- `then` run the command(s) that follow.
- `echo $num` run this command.
- `fi` close the if statement.
- `done` close the `for` loop.


### 05. Lists and Loops

- [Lists and Loops Activity](Activities/06_STU_Lists_and_Loops/Unsolved/Readme.md)

### 06. Lists and Loops Review

- [Solution Guide](Activities/06_STU_Lists_and_Loops/Solved/Readme.md)

### 07. Break

### 08. `For` Loops for a SysAdmin

Now, we will continue to develop our `for` loop skills by using them to help audit a machine.

Sometimes, writing a script might be overkill for the scale of the task at hand, so we will use these `for` loops directly on the command line, outside of a script.

For loops are extremely valuable tool for cybersecuirty professionals:

- Loop through a list of packages to check if they are installed.

- Loop through the results of a find command and take action on each item found.

- Loop through a group of files, check their permissions and change if needed.

- Loop through a group of files and create a cryptographic hash of each file.

- Loop through all the users on the system and take an action for each one.


Get started by completing the following set up:

- Log into the lab environment with the username `sysadmin` and password `cybersecurity`.

- Open a terminal.

- Open the `useful_loops.sh` file

- Run `nano useful_loops.sh`


We will start by checking if certain packages are installed.


#### Looping Packages

In this example, we are using a for loop to run through a list of packages and check is certain ones are installed.

```bash
# Define packages list
packages=(
    'nano'
    'wget'
    'net-tools'
)

# loop though the list of packages and check to see if they are installed
for package in ${packages[0]};
do
    if [ $(which $package) ]
    then
        echo "$package is installed at $(which $package)."
    else
        echo "$package is not installed."
    fi
done
```


Syntax breakdown:

-  `for package in ${packages[0]};`: For package `0` in the list `packages`...

    - In our list, `0` is the first item: `nano`.

- `if [ $(which $package) ]`: If the command `which package` returns a value...

  - **Note:** When we run a command, it always returns a value, either `0` or `1`. `0` means the command was successful (`TRUE`) and  `1` means it fails (`FALSE`).

- `echo "$package is installed at $(which $package)."`: Run this echo command that states that the package is installed.
- `else`: "Otherwise...:
- `echo "$package is not installed."`: Run this echo command that states that the package is not installed.


#### Looping Users

In this example, we will search each user's home directory for scripts and print a confirmation statement.

```bash
# Search each user's home directory for scripts and provide a formatted output.
for user in $(ls /home);
do   
    for item in $(find /home/$user -iname '*.sh');
    do
        echo -e "Found a script in $user's home folder! \n$item"
    done
done
```

In this demo, we used  a **nested loop**, a loop within a loop.

- We are looping through two separate lists:

- First, we create a list using `ls /home` to gather the names of each user on the system.

- Then for each user, we search their home directory for files ending in `.sh`.

- For each file that is found, we print a string that tells us which user's home folder it was found and the full path of the file.

Syntax Breakdown:

- `for user in $(ls /home);` "For the user in the list that is returned by running `ls /home`..."

- `for item in $(find /home/$user -iname '*.sh');` "For each item found in the user's home folder that ends in `.sh`..."

- `echo -e "Found a script in $user's home folder! \n$item"` "Run this echo command stating that we found a script."

Note the use of the `-e` flag and the `\n` line break in the echo command, to format the output.

#### Looping Permissions

Move on to the next example:

```bash
# loop through scripts in my scripts folder and change the permissions to execute
for script in $(ls ~/scripts);
do
    if [ ! -x ~/scripts/$script ]
    then
        chmod +x ~/scripts/$script
    fi
done
```

Syntax Breakdown:

- `for script in $(ls ~/scripts);` for each file returned by the command `ls ~/scripts`

- `if [ ! -x ~/scripts/$script ]` _"if not executable the file"_ or, if the file is not executable.

- `chmod +x ~/scripts/$script` run this chmod command to set the file to executable.

#### Looping Hashes

In the final example, we will create a `for` loop that moves through a group of files and creates a hash of each file.

```bash
# loop through a group of files and create a hash of each file.
for file in $(ls ~/Documents/files_for_hashing/);
do
    sha256sum $file
done
```

Syntax breakdown:

- `for file in $(ls ~/Documents/files_for_hashing/);` For each file returned by running this `ls` command.

- `sha256sum $file`: Run this command (Create a sha256sum hash).

A hash is a cryptographic representation of the file that helps ensure file integrity. If the file changes, the hash changes.

- We will cover `check sums` or `hashes` in depth during the cryptography week.

- We're using hashes as a real world example of looping through a list of files and applying a command to them.

Close the file and return to the command line.

#### For Loops on the Command Line

Not every for loop we write requires a script. Bash allows us to write `for` loops directly on the command line in order to quickly complete tasks.

The only difference between for loops on the command line and in scripts is the syntax: on command lines, we're writing the loop on a single line.

- Type: `for user in $(ls /home); do echo "Username is: $user"; done`

Note the difference in syntax: the `;` after your `do` section and before your `done` statement.

- Run: `for user in $(ls /home); do echo "Username is: $user"; done`

Syntax breakdown:

- `for user in $(ls /home);` is exactly the same way we would start the loop in a script.

- `do echo "Username is: $user"` Here the `do` is on the same line as our command.
- `;` You must separate the `do` section from the `done` statement
- `done` closes the for loop.

#### Brace Expansion and For Loops

You can also use brace expansion directly with a for loop.

- Run `for num in {1..10}; do mkdir my_dir_$num; done`

- Run `ls`.

Your output should be:

```bash
my_dir_1   my_dir_2  my_dir_4  my_dir_6  my_dir_8
my_dir_10  my_dir_3  my_dir_5  my_dir_7  my_dir_9
```

Syntax breakdown:

- `for num in {1..10};` is exactly the same way we would start the loop in a script.

- `do mkdir my_dir_$num;` `do` is on the same line with your command, followed by a `;`.
- `done` closes the `for` loop.

Command line usage like this really starts to speed up your work in the command line.

### 09. Loops for SysAdmins
- [SysAdmin Loops](Activities/09_STU_Useful_Loops/Unsolved/Readme.md)

### 10. Useful loops Review

- [Solution Guide](Activities/09_STU_Useful_Loops/Solved/Readme.md)


### 11. Script Along

Now we will walkthrough creating a 'setup' script.

#### Script Along

Log into the lab environment with the username `sysadmin` and password `cybersecurity`.

- Open a terminal.

Create a new file called `setup.sh`.

- Run `nano setup.sh`

- Type: `!/bin/bash` at the top of the script.

We will start with a comment of what the script does:

- Type: `# Quick setup script for new server.`

This script will run several commands that will need `sudo` access, so we want to ensure that users run the script using `sudo`.

- Type:

  ```bash
  # Make sure the script is run as root.
  if [ ! $UID -eq 0 ]
  then
    echo "Please run this script as root."
    exit
  fi
  ```

Note: this is the same statement we used in the previous exercises.

We will want this script to create a log file that documents everything it did. This will be easier if we create a variable that holds the path to our log file.

- Type:

  ```bash
  # Create a log file that our script will write to as it completes items
  log_file=/var/log/setup_script.log
  ```

Now, we want our log file to have a header and a nice format:

- Type:
  ```bash
  # Log file header
  echo "Log file for general server setup script." >> $log_file
  echo "############################" >> $log_file
  echo "Log generated on: $(date)" >> $log_file
  echo "############################" >> $log_file
  echo "" >> $log_file
  ```

Next, we will want our setup script to check the system for certain packages. If those packages aren't there, we will want to install them.

Start by creating a list of packages:

- Type:

  ```bash
  # List of packages needed on the System
  packages=(
    'nano'
    'wget'
    'net-tools'
    'python'
    'tripwire'
    'tree'
    'curl'
  )
  ```

Now we need a `for` loop that will check for each package and install it if it isn't there.

- Type:

  ```bash
  # Check for installed packages. If they are not installed, install them.
  for package in ${packages[@]};
  do
    if [ ! $(which $package) ];
    then
      apt install -y $package
    fi
  done
  ```

Syntax breakdown:

- `for package in ${packages[@]};` For each package in our list of packages...

- `if [ ! $(which $package) ];` If the command `which $package` fails...

- `apt install -y $package` Run the command to install the package.

Note: the `-y` option for the `apt install` will answer yes to any questions the installer has for any of these packages.

We don't need to use `sudo` here, because the script will only run if it is run with `sudo` in the first place. So, every command we write will run with `root` privileges.

After these installations are complete, we want to log them. It would also be nice to print out a message to the screen that tells us what happened.

- The command `tee` does exactly this: it will print the output to the screen, and send the output to the file of our choice.

We want to be sure to use the `-a` option so that `tee` _appends_ to our log file, otherwise it overwrites it:

```bash
# Print it out and Log it
echo "$(date) Installed needed pacakges: ${packages[@]}" | tee -a $logfile
```

Next, we want to setup our `sysadmin` user on the system and give them the correct `sudo` permissions:

```bash
# Create a sysadmin user with no password (password to be created upon login)
useradd sysadmin
chage -d 0 sysadmin
```

Add a user to the `sudo` group:


```bash
# Add sysadmin user to the `sudo` group
usermod -aG sudo sysadmin
```

Log these actions:


```bash
# Print it out and Log it
echo "$(date) Created sys_admin user. Password to be created upon login" | tee -a $log_file
```

Now, we can take some steps to harden the system:


```bash
# Remove roots login shell and lock the root account.
usermod -s /sbin/nologin root
usermod -L root

# Print it out and Log it
echo "$(date) Disabled root shell. Root user cannot login." | tee -a $log_file

# Change permissions on sensitive files
chmod 600 /etc/shadow
chmod 600 /etc/gshadow
chmod 644 /etc/group
chmod 644 /etc/passwd

# Print it out and Log it
echo "$(date) Changed permissions on sensitive /etc files." | tee -a $log_file
```

It might be nice to setup our `scripts` folder and add it to our path, so we can start making custom commands as needed on the system:

```bash
# Setup scripts folder
if [ ! -d /home/sysadmin/scripts ]
then
mkdir /home/sysadmin/scripts
chown sysadmin:sysadmin /home/sysadmin/scripts
fi

# Add scripts folder to .bashrc for sysadmin
echo "" >> /home/sysadmin/.bashrc
echo "PATH=$PATH:/home/sysadmin/scripts" >> /home/sysadmin/.bashrc
echo "" >> /home/sysadmin/.bashrc

# Print it out and Log it
echo "$(date) Added ~/scripts directory to sysadmin's PATH." | tee -a $log_file
```

Adding a few custom aliases might be nice too!

```bash
# Add custom aliases to /home/sysadmin/.bashrc
echo "#Custom Aliases" >> /home/sysadmin/.bashrc
echo "alias reload='source ~/.bashrc && echo Bash config reloaded'" >> /home/sysadmin/.bashrc
echo "alias lsa='ls -a'" >> /home/sysadmin/.bashrc
echo "alias docs='cd ~/Documents'" >> /home/sysadmin/.bashrc
echo "alias dwn='cd ~/Downloads'" >> /home/sysadmin/.bashrc
echo "alias etc='cd /etc'" >> /home/sysadmin/.bashrc
echo "alias rc='nano ~/.bashrc'" >> /home/sysadmin/.bashrc

# Print it out and Log it
echo "$(date) Added custom alias collection to sysadmin's bashrc." | tee -a $log_file
```

We should end our script with a message to let the user know it's finished.

```bash
#Print out and log Exit
echo "$(date) Script Finished. Exiting."
echo "$(date) Script Finished. Exiting." >> $log_file

exit
```

Save and quit the script.

- Run `chmod +x setup.sh`

This script should be ready to run on any new system.

-------

### Copyright

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
