## Command to change the default home directory of a user

### 问题背景

> I would like to know whether there is any simple shell command to change the user home directory in Linux/Unix without touching the `/etc/passwd` file. 



### 方法

> ### Change the user's home directory:
>
> ```sh
> usermod -d /newhome/username username
> ```
>
> `usermod` is the command to edit an existing user.
> `-d` (abbreviation for `--home`) will change the user's home directory.
>
> 
>
> ### Change the user's home directory + Move the contents of the user's current directory:
>
> ```sh
> usermod -m -d /newhome/username username
> ```
>
> `-m` (abbreviation for `--move-home`) will move the content from the user's current directory to the new directory.



## 参考

1. [Command to change the default home directory of a user ](https://stackoverflow.com/questions/20797819/command-to-change-the-default-home-directory-of-a-user)