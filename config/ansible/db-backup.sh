#!/usr/bin/env bash

set -eo pipefail

backup_dir=/home/appo/backups/pg
today=`date '+%Y-%m-%d-%H-%M'`
db='appolearning2015_production'

mkdir -p $backup_dir
rm -Rf $backup_dir/*
cd $backup_dir

/usr/bin/pg_dump --clean "$db" | gzip > "$db-pg_dump-clean-$today.sql.gz"

<<<<<<< HEAD
#/usr/bin/s3cmd --progress put *.* s3://com.greenprint.backups/greenprint-db/current/
/usr/bin/aws s3 cp *.* s3://com.greenprint.backups/greenprint-db/current/
=======
#/usr/bin/s3cmd --progress put *.* s3://com.participate.backups/participate-db/current/
/usr/bin/aws s3 cp *.* s3://com.participate.backups/participate-db/current/
>>>>>>> parent of 0bd3464... customize to greenprintmedia

