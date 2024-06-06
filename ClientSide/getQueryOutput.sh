#!/bin/bash

SCHEMA_NAME='SchemaName'
SCHEMA_PASSWORD='SchemaPassword'
SID='SID-Name'
SQLPLUS_PATH='/path/to/sqlplus'
OUTPUT_PATH=/tmp # Leave this is as /tmp 
PROJECT_NAME="ProjectName"


$SQLPLUS_PATH $SCHEMA_NAME/$SCHEMA_PASSWORD@$SID << EOF
    @db_booking_count.sql
EOF

sed -e '/^$/d' -e '1d' lastMonthBookingCount.csv > temp.csv  
sed -e '1d' temp.csv  > temp2.csv
rm temp.csv
sed -e 's/"//g' temp2.csv > lastMonthBookingCount.csv
rm temp2.csv

mv lastMonthBookingCount.csv "$OUTPUT_PATH/${PROJECT_NAME}_TBX_Bookings_Quotes_Count_Reports.csv"