| Syntax                                      | Description                                                  | Examples                                                     |
| ------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| rpm -ivh {rpm-file}                         | Install the package                                          | rpm -ivh mozilla-mail-1.7.5-17.i586.rpm<br/>rpm -ivh --test mozilla-mail-1.7.5-17.i586.rpm |
| rpm -Uvh {rpm-file}                         | Upgrade package                                              | rpm -Uvh mozilla-mail-1.7.6-12.i586.rpm<br/>rpm -Uvh --test mozilla-mail-1.7.6-12.i586.rpm |
| rpm -ev {package}                           | Erease/remove an installed package                           | rpm -ev mozilla-mail                                         |
| rpm -ev --nodeps {package}                  | Erease/remove an installed package without checking for dependencies | rpm -ev --nodeps mozilla-mail                                |
| rpm -qa                                     | Display list all installed packages                          | rpm -qa<br />rpm -qa \| less                                 |
| rpm -qi {package}                           | Display installed information along with package version and short description | rpm -qi mozilla-mail                                         |
| rpm -qf {/path/to/file}                     | Find out what package a file belongs to i.e. find what package owns the file | rpm -qf /etc/passwd<br/>rpm -qf /bin/bash                    |
| rpm -qc {package-name}                      | Display list of configuration file(s) for a package          | rpm -qc httpd                                                |
| rpm -qcf {/path/to/file}                    | Display list of configuration file(s) for a command          | rpm -qcf /usr/X11R6/bin/xeyes                                |
| rpm -qa --last                              | Display list of all recently installed RPMs                  | rpm -qa --last<br />rpm -qa --last \| less                   |
| rpm -qpR {.rpm-file}<br />rpm -qR {package} | Find out what dependecies a rpm file has                     | rpm -qpR mediawiki-1.4rc1-4.i586.rpm<br/>rpm -qR bash        |

### 参考
1. [	
rpm command cheat sheet for Linux](https://www.cyberciti.biz/howto/question/linux/linux-rpm-cheat-sheet.php)