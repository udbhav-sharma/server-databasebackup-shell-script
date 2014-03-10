# !/bin/bash

# defining constants
temp_directory="/tmp/"
database_username=""
database_password=""
mysqlpath="/opt/lampp/bin/mysqldump"
db_name="_full_database"

readonly temp_directory
readonly database_username
readonly database_password
readonly mysqlpath

#getting date
date=`date +"%y-%m-%d"`

#defining databasename with Date
db_name="$date$db_name"

$mysqlpath -A --lock-tables=true -u $database_username -p$database_password > $temp_directory$db_name.sql
filestobezipped="$db_name.sql"

#displaying filename
echo -e "File getting zipped are: \n$filestobezipped"

#creating tar.gz file
cd $temp_directory

tar -rvf $temp_directory$db_name.tar.gz $filestobezipped << EOF
y
EOF

#removing temporary files
rm $filestobezipped
