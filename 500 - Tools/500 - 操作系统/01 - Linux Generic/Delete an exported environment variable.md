## Delete an exported environment variable



### 问题

> Before installing gnuplot, I set the environment variable `GNUPLOT_DRIVER_DIR = /home/gnuplot/build/src`. During the installation, something went wrong.
>
> I want to remove the `GNUPLOT_DRIVER_DIR` environment variable. How can I achieve it?



### 解决方法

> `unset` is the command you're looking for.
>
> ```bash
> unset GNUPLOT_DRIVER_DIR
> ```





## 参考

1. [How do I delete an exported environment variable?](https://stackoverflow.com/questions/6877727/how-do-i-delete-an-exported-environment-variable)

