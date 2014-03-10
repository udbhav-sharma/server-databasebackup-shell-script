1. Change the directories as per need of server. Directories are defined as constants in scripts.
2. Since 2 scripts are using same directories, make sure you change in both of them.
	 example Main_backup.sh and server_backup.sh have same $temp_directory variable.
3. Comments are there in code.
4. If u want to run as it is
   Download both the folders WSDC_Databases_Backup and WSDC_Databases_Full_Backup
   Edit the path of the 2 folders in the Main_backup.sh and Main_backup_full.sh of respective folders.
5. In terminal execute export EDITOR='nano'
6. Finally run command crontab -e.
   A file will be opened. At the bottom of the file append these 2 lines
   0 4 * * 0-7 <path of WSDC_Databases_Backup>Main_backup.sh > <path of WSDC_Databases_Backup>output
   30 4 * * 7 <path of WSDC_Databases_Full_Backup>Main_backup_full.sh > <path of WSDC_Databases_Full_Backup> output
7. With this everyday at 4am server will take the backup of databases listed in file databases_name
   and every sunday at 4.30am  server will take the backup of whole database.
8. Backup files will be stored in their respective folders with name as their creation date.
   Whole database backup will have _full_database appended to it at last.
9. For exiting from editor press ctrl-x then y then enter. crontab file is modified. 
10. One very important thing u need to have ssh login at the remote system. U also need to have ssh login without password. Whenever u login with ssh u need to enter password but with this link details u dont have to do it. Checking will be done automatically.
