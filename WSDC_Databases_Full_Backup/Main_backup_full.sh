# !/bin/bash

#defining constants
server_backup_script_name="server_backup_full.sh"
backup_directory="/home/udbhav/WSDC_Databases_Full_Backup/"
temp_directory="/tmp/" #directory on remote server
server_backup_script="$backup_directory$server_backup_script_name"
filegenerated="_full_database.tar.gz"
username=""
server_IP=""

readonly server_backup_script_name
readonly backup_directory
readonly temp_directory
readonly server_backup_script
readonly username
readonly server_IP

cd $backup_directory

#scp command to copy the script from ur system to remote server
scp $server_backup_script $username@$server_IP:$temp_directory

#ssh login to execute the script
ssh $username@$server_IP "$temp_directory$server_backup_script_name"

date=`date +"%y-%m-%d"`

filegenerated="$date$filegenerated"
#scp command to copy the contents from remote to ur system
scp $username@$server_IP:$temp_directory$filegenerated $backup_directory

#ssh login to remove the file
ssh $username@$server_IP "rm $temp_directory$filegenerated"