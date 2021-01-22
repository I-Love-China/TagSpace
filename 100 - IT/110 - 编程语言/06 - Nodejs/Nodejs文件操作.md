## 常用文件操作
### 复制文件夹 ^[1][2]^
使用 fs-extra 包

```javascript
const fse = require('fs-extra');


const srcDir = `path/to/file`;
const destDir = `path/to/destination/directory`;
                              
// To copy a folder or file  
fse.copySync(srcDir, destDir, function (err) {
  if (err) {                 ^
    console.error(err);      |___{ overwrite: true } // add if you want to replace existing folder or file with same name
  } else {
    console.log("success!");
  }
});
```

### 参考
1. [Copy folder recursively in Node.js](https://stackoverflow.com/questions/13786160/copy-folder-recursively-in-node-js)
2. [Node.js: fs-extra](https://www.npmjs.com/package/fs-extra)
```

```