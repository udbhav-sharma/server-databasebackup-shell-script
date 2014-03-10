# !/bin/bash

# defining constants
temp_directory="/tmp/"
databases_name="/tmp/databases_name"
database_username=""
database_password=""
mysqlpath="/opt/lampp/bin/mysqldump"

readonly temp_directory
readonly databases_name
readonly database_username
readonly database_password
readonly mysqlpath

#reading databases name from file
while read db_name
do
	$mysqlpath -u $database_username --lock-tables=true -p$database_password $db_name > $temp_directory$db_name.sql
	filestobezipped="$filestobezipped$db_name.sql "
done < $databases_name

#getting date
date=`date +"%y-%m-%d"`

#displaying filename
echo -e "File getting zipped are: \n$filestobezipped"

#creating tar.gz file
touch $temp_directory$date.tar.gz

cd $temp_directory

#appending file in zip file 
for filename in $filestobezipped
do
tar -rvf $temp_directory$date.tar.gz $filename << EOF
y
EOF
done

#removing temporary files
while read db_name
do
	rm $db_name.sql
done < $databases_name
