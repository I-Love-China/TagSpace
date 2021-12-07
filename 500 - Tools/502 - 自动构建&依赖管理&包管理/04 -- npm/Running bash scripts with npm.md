## Running bash scripts with npm



> Its totally possible...
>
> ```json
> "scripts": {
>    "build": "./build.sh"
> },
> ```
>
> also, make sure you put a hash bang at the top of your bash file `#!/usr/bin/env bash`
>
> also make sure you have permissions to execute the file
>
> ```perl
> chmod +x ./build.sh
> ```
>
> Finally, the command to run build in npm would be
>
> ```bash
> npm run build
> ```



## 参考

1. [Running bash scripts with npm](https://stackoverflow.com/questions/34937724/running-bash-scripts-with-npm)