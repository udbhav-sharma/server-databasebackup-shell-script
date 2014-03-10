# !/bin/bash

#defining constants
databases_filename="databases_name"
server_backup_script_name="server_backup.sh"
backup_directory="/home/udbhav/WSDC_Databases_Backup/"
temp_directory="/tmp/" #directory on remote server
databases_name="$backup_directory$databases_filename"
server_backup_script="$backup_directory$server_backup_script_name"
filegenerated=".tar.gz"
removal_script="Remove_outdated_database.sh"
username=""
server_IP=""

readonly databases_filename
readonly server_backup_script_name
readonly backup_directory
readonly temp_directory
readonly databases_name
readonly server_backup_script
readonly username
readonly server_IP

cd $backup_directory
#scp command to copy the databases_name and script file from ur system to remote server
scp $databases_name $server_backup_script $username@$server_IP:$temp_directory

#ssh login to execute the script
ssh $username@$server_IP "$temp_directory$server_backup_script_name"

date=`date +"%y-%m-%d"`

filegenerated="$date$filegenerated"
#scp command to copy the contents from remote server to ur system
scp $username@$server_IP:$temp_directory$filegenerated $backup_directory

#ssh login to remove the file
ssh $username@$server_IP "rm $temp_directory$filegenerated"

#script on ur system to remove the outdated backups
$backup_directory$removal_script