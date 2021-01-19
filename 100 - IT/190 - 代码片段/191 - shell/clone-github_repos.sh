#!/usr/bin/env bash

# 安装必要的依赖: jq
if [[ "$OSTYPE" == "darwin"* ]]; then # MacOS
    echo brew install jq
    brew install jq
elif [ -f /etc/debian_version ]; then # Debian
    echo apt install jq
    sudo apt install jq -y
fi

# 用户输入必要的参数: 用户名、密码、使用的传输协议(HTTP、SSH)
read -p "请输入您的 Github 用户名: " USERNAME
read -p "请输入您的密码: " PASSWORD

PS3="请选择您要使用的传输协议: "
select TRANSPORT_PROTOCOL in ssh http; do
    break
done

# 解析用户所有仓库的地址
# RESPONSE=$(curl -u$USERNAME:$PASSWORD https://api.github.com/user/repos\?visibility=all)
# RESPONSE=`cat github.myrepos.json`
REPOS=""
case $TRANSPORT_PROTOCOL in
ssh)
    REPOS=$(echo $RESPONSE | jq -r '.[].ssh_url')
    ;;
http)
    REPOS=$(echo $RESPONSE | jq -r '.[].clone_url')
    ;;
esac

# clone 所有项目
echo "$REPOS" | while IFS= read -r repo; do
    echo ==============================
    echo git clone $repo
    git clone $repo
done
