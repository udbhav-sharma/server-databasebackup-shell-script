# !/bin/bash

#define constants
backup_days=30

readonly backup_days

#getting file names in sorted order
find -regex .*[.][t][a][r][.][g][z] | sort -d -f -r > tmp_sort_file

count=0
echo "files to be deleted are:"
while read filename
do
	if [ $count -ge $backup_days ];
	then
		echo $filename
		rm $filename
	fi
	count=`expr $count + 1`
done < tmp_sort_file

rm tmp_sort_file
