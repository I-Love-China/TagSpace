## ==Temporarily== change current working directory in bash to run a command

### 问题

> I know I can use `cd` command to change my working directory in bash.
>
> But if I do this command:
>
> ```sh
> cd SOME_PATH && run_some_command
> ```
>
> ==Then the working directory will be changed permanently==. Is there some way to change the working directory just temporarily like this?
>
> ```sh
> PWD=SOME_PATH run_some_command
> ```



### 解决方法

A. Subshell

> You can run the `cd` and the executable in a ==subshell== by enclosing the command line in a pair of parentheses:
>
> ```sh
> (cd SOME_PATH && exec_some_command)
> ```
>
> Demo:
>
> ```sh
> $ pwd
> /home/abhijit
> $ (cd /tmp && pwd)  # directory changed in the subshell
> /tmp 
> $ pwd               # parent shell's pwd is still the same
> /home/abhijit
> ```



B. pushd

> ==bash== has a builtin
>
> ```sh
> pushd SOME_PATH
> run_stuff
> ...
> ...
> popd 
> ```



## 参考

1. [Temporarily change current working directory in bash to run a command](https://stackoverflow.com/questions/10382141/temporarily-change-current-working-directory-in-bash-to-run-a-command)