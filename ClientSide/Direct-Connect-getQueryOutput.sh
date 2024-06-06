#!/bin/bash

# Oracle DB Details
SCHEMA_NAME='SchemaName'
SCHEMA_PASSWORD='SchemaPassword'
SID='SID-Name'
SQLPLUS_PATH='/path/to/sqlplus'

# MYSQL DB Details

MYSQL_USERNAME="demodbuser"
MYSQL_PASSWORD="Abc@12345"
MYSQL_HOST="172.22.33.90"
DATABASE="grafana_db"
TABLE="grafana_db"

$SQLPLUS_PATH $SCHEMA_NAME/$SCHEMA_PASSWORD@$SID << EOF
    @db_booking_count.sql
EOF

sed -e '/^$/d' -e '1d' lastMonthBookingCount.csv > temp.csv  
sed -e '1d' temp.csv  > temp2.csv
rm temp.csv
sed -e 's/"//g' temp2.csv > lastMonthBookingCount.csv
rm temp2.csv

while IFS=',' read -r date folderName backupSize_gb; do
    # Output or process the extracted values as needed
    DATE="$date"
    FolderName="$folderName"
    Backupsize_gb="$backupSize_gb"
done < lastMonthBookingCount.csv

# MySQL query to insert data into the database
mysql -h "${MYSQL_HOST}" -u "${MYSQL_USERNAME}" -p"${MYSQL_PASSWORD}" -e "
USE ${DATABASE};
INSERT INTO ${TABLE} (Date, FolderName, Backupsize_gb) VALUES ('$DATE', '$FolderName', '$Backupsize_gb');
SELECT * FROM grafana_db WHERE FolderName='$FolderName';
"