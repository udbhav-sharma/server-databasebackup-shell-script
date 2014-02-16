# !/bin/bash

#defining constants
databases_filename="databases_name"
server_backup_script_name="server_backup.sh"
backup_directory="/home/udbhav/WSDC_Databases_Backup/"
temp_directory="/tmp/" #directory on server 172.20.0.4
databases_name="$backup_directory$databases_filename"
server_backup_script="$backup_directory$server_backup_script_name"
filegenerated=".tar.gz"
removal_script="Remove_outdated_database.sh"

readonly databases_filename
readonly server_backup_script_name
readonly backup_directory
readonly temp_directory
readonly databases_name
readonly server_backup_script

cd $backup_directory
#scp command to copy the databases_name and script file from 168 to 4 server
scp $databases_name $server_backup_script gopi@172.20.0.4:$temp_directory

#ssh login to execute the script
ssh gopi@172.20.0.4 "$temp_directory$server_backup_script_name"

date=`date +"%y-%m-%d"`

filegenerated="$date$filegenerated"
#scp command to copy the contents from 4 to 168 server
scp gopi@172.20.0.4:$temp_directory$filegenerated $backup_directory

#ssh login to remove the file
ssh gopi@172.20.0.4 "rm $temp_directory$filegenerated"

#script on 168 server to remove the outdated backups
$backup_directory$removal_script