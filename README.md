# Mysql tutorial

### Command
- dump database : mysqldump --user=root --password='pwd' --host='localhost' database > path/name_$(date "+%b_%d_%Y_%H_%M_%S").sql
- Connect to mysql : mysql –uroot –ppassword
- Download result query into csv file :  mysql –uROOT –pPWD "SELECT * FROM zones;" | sed "s/'/\'/;s/\t/\",\"/g;s/^/\"/;s/$/\"/;s/\n//g" >zones.csv
- Copy folder or data : scp -P ***  root@nameserver:path/to/file C:\Users\Marc\Desktop

-Import data from backup file into table : [Source](https://stackoverflow.com/questions/17666249/how-do-i-import-an-sql-file-using-the-command-line-in-mysql) 
You can load the dump file back into the server like this:

UNIX

shell> mysql db_name < backup-file.sql
The same in Windows command prompt:

mysql -p -u [user] [database] < backup-file.sql
PowerShell

C:\> cmd.exe /c "mysql -u root -p db_name < backup-file.sql"
MySQL command line

mysql> use db_name;
mysql> source backup-file.sql;


##### Url command list
- [https://alibaba-cloud.medium.com/how-to-manage-mysql-database-with-commands-968e3e0dd158](https://alibaba-cloud.medium.com/how-to-manage-mysql-database-with-commands-968e3e0dd158)
- [https://medium.com/@mandeepkaur1/a-list-of-mysql-commands-c4d0d244aa5c](https://medium.com/@mandeepkaur1/a-list-of-mysql-commands-c4d0d244aa5c)
- [https://gist.github.com/hofmannsven/9164408](https://gist.github.com/hofmannsven/9164408)
- [http://g2pc1.bu.edu/~qzpeng/manual/MySQL%20Commands.htm](http://g2pc1.bu.edu/~qzpeng/manual/MySQL%20Commands.htm)

