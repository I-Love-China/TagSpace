#!/usr/bin/env bash

TARGET=typist@192.168.1.146

# TagSpace
echo TagSpace
cd /home/typist
rsync -rcza -e ssh --info=progress2 TagSpace $TARGET:~/G410Rsync


# Books
# 网页存档
# zotero
cd /media/typist/266g/Home

echo Books
rsync -rcza -e ssh --info=progress2 Books $TARGET:~/G410Rsync

echo 网页存档
rsync -rcza -e ssh --info=progress2 网页存档 $TARGET:~/G410Rsync

echo zotero
rsync -rcza -e ssh --info=progress2 zotero $TARGET:~/G410Rsync
