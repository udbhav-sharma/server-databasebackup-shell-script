# !/bin/bash

#defining constants
server_backup_script_name="server_backup_full.sh"
backup_directory="/home/udbhav/WSDC_Databases_Full_Backup/"
temp_directory="/tmp/" #directory on server 172.20.0.4
server_backup_script="$backup_directory$server_backup_script_name"
filegenerated="_full_database.tar.gz"

readonly server_backup_script_name
readonly backup_directory
readonly temp_directory
readonly server_backup_script

cd $backup_directory

#scp command to copy the script from 168 to 4 server
scp $server_backup_script gopi@172.20.0.4:$temp_directory

#ssh login to execute the script
ssh gopi@172.20.0.4 "$temp_directory$server_backup_script_name"

date=`date +"%y-%m-%d"`

filegenerated="$date$filegenerated"
#scp command to copy the contents from 4 to 168 server
scp gopi@172.20.0.4:$temp_directory$filegenerated $backup_directory

#ssh login to remove the file
ssh gopi@172.20.0.4 "rm $temp_directory$filegenerated"