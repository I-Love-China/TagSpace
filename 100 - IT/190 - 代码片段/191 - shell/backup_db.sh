#!/usr/bin/env bash

DB=$1
DATE_TIME=`date  +"%Y%m%dT%H%M%S"`

mysqldump -h 192.168.1.21 -uroot -p --databases $DB | sed -e '/^USE `/d' >  $DB.$DATE_TIME.db
