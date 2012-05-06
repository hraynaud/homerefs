#!/bin/bash

function OldestBackupName () {
  heroku pgbackups --app homerefs | grep ^b | sort -r | tail -n 1 | cut -d"|" -f 1
}

function LastBackupName () {
  heroku pgbackups --app homerefs | grep ^b | sort | tail -n 1 | cut -d"|" -f 1
}

# This part assumes you have a low limit on no. of backups allowed
old_backup=$(OldestBackupName)
heroku pgbackups:destroy $old_backup --app homerefs

heroku pgbackups:capture --app homerefs
new_backup=$(LastBackupName)
curl $(heroku pgbackups:url $new_backup --app homerefs) > temporary_backup.dump
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d homerefs_development temporary_backup.dump
rm -f temporary_backup.dump
