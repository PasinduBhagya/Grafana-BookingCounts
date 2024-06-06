#!/bin/bash

SCHEMA_NAME='SchemaName'
SCHEMA_PASSWORD='SchemaPassword'
SID='SID-Name'
SQLPLUS_PATH='/path/to/sqlplus'
OUTPUT_PATH="/tmp"
PROJECT_NAME="ProjectName"
TODAY_DATE=$(date +'%Y-%m-%d')

# Execute SQL script to get data
#$SQLPLUS_PATH $SCHEMA_NAME/$SCHEMA_PASSWORD@$SID << EOF
#    @db_booking_count.sql
#EOF

# Preprocessing CSV file
sed -e '/^$/d' -e '1d' lastMonthBookingCount.csv > temp.csv  
sed -e '1d' temp.csv  > temp2.csv
rm temp.csv
sed -e 's/"//g' temp2.csv > lastMonthBookingCount.csv
rm temp2.csv

# Read the single line from CSV
read -r YEAR MONTH BOOKING_COUNT PAX_COUNT QUOTE_COUNT QUOTE_PAX_COUNT < lastMonthBookingCount.csv

# Create the XML File
xmlFileFormat="
    <pulseBookingCount>
        <FILE_DATE>$TODAY_DATE</FILE_DATE>
        <YEAR>$YEAR</YEAR>
        <MONTH>$MONTH</MONTH>
        <BOOKING_COUNT>$BOOKING_COUNT</BOOKING_COUNT>
        <PAX_COUNT>$PAX_COUNT</PAX_COUNT>
        <QUOTE_COUNT>$QUOTE_COUNT</QUOTE_COUNT>
        <QUOTE_PAX_COUNT>$QUOTE_PAX_COUNT</QUOTE_PAX_COUNT>
    </pulseBookingCount>
"
echo "$xmlFileFormat" > "$PROJECT_NAME.xml"
