#!/bin/bash

function OldestBackupName () {
  heroku pgbackups --app homerefs | grep ^b | sort -r | tail -n 1 | cut -d"|" -f 1
}

# This part assumes you have a low limit on no. of backups allowed
old_backup=$(OldestBackupName)
heroku pgbackups:destroy $old_backup --app homerefs

heroku pgbackups:capture --app homerefs
heroku pgbackups:restore DATABASE `heroku pgbackups:url --app homerefs` --app homerefs-staging --confirm homerefs-staging
