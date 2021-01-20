const fs = require('fs');


function dirname(docDir) {
  return docDir.substring(docDir.lastIndexOf('/') + 1);
}

// 生成 sidebar 时需要忽略的文件[夹]，
function shouldContentIgnore(contentWithPath = '', rootPath = '') {
  if (rootPath + '/.vuepress' == contentWithPath) { // 忽略 vuepress 配置文件
    return true;
  }

  if (
    dirname(contentWithPath).startsWith('.')
    ||
    contentWithPath.replace(rootPath + '/', '').startsWith('.')) { // 忽略隐藏文件[夹]
    return true;
  }

  return false;
}

/**
 * 根据文件目录生成 sidebar 配置，生成的 sidebar 与文件管理器相同
 * title 为文件名
 * @param {当前递归需要处理的文件夹} docDir 
 * @param {docs 根路径} rootPath 
 */
function resolveSidebar(docDir, rootPath) {
  const dirContents = fs.readdirSync(docDir);

  const children = [];
  const contents = dirContents
    .filter(c => !shouldContentIgnore(`${docDir}/${c}`, rootPath));

  if (!contents || !contents.length) {
    return { title: dirname(docDir) };
  }

  contents.forEach(c => {
    const cWithPath = `${docDir}/${c}`;
    if (fs.statSync(cWithPath).isFile()) {
      children.push({
        title: c.slice(0, -3), // 文件名，去掉 '.md' 后缀的
        path: cWithPath.slice(0, -3).replace(rootPath, '') // 相对 rootPath 的路径
      });

      return;
    }

    children.push(resolveSidebar(cWithPath, rootPath));
  });

  const dirName = docDir.substring(docDir.lastIndexOf('/') + 1); // 最后一级目录名
  return { title: dirName, children };
}


module.exports = {
  themeConfig: {
    nextLinks: false,

    // 默认值是 true 。设置为 false 来禁用所有页面的 上一篇 链接
    prevLinks: false,

    // 去掉顶部导航栏
    navbar: false,

    /**
     * 只显示文章名，不显示内部 header 的名称
     * https://vuepress.vuejs.org/zh/theme/default-theme-config.html#%E5%B5%8C%E5%A5%97%E7%9A%84%E6%A0%87%E9%A2%98%E9%93%BE%E6%8E%A5
     */
    sidebarDepth: 0, // 


    sidebar: [
      ...(resolveSidebar('./TagSpace', './TagSpace').children || [])
    ]

  }
}
