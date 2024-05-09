from configparser import ConfigParser
import shutil
import os
config = ConfigParser()
config.read('./.env')

import mysql.connector

def connectToDatabase():
    return mysql.connector.connect(
        host=config.get('DATABASE', 'HOST'),
        user=config.get('DATABASE', 'USER'),
        password=config.get('DATABASE', 'PASSWORD'),
        database=config.get('DATABASE', 'DATABASE'),
    )

def fetchFromDatabase(sql_query):
    database = connectToDatabase()
    dbcursor = database.cursor()
    dbcursor.execute(sql_query)
    output = dbcursor.fetchall()
    database.close() 
    return output

def addToDatabase(csvFileName):
    database = connectToDatabase()
   
    if os.path.isfile(f"/var/lib/mysql-files/{csvFileName}"):
        os.remove(f"/var/lib/mysql-files/{csvFileName}")
    try:
        shutil.copy(f"SAMPLE_DATA/{csvFileName}", "/var/lib/mysql-files/")
        dbcursor = database.cursor()
        sql_query = f""" 
            LOAD DATA INFILE '/var/lib/mysql-files/{csvFileName}'
            INTO TABLE TBX_Bookings_Quotes_Count_Reports
            FIELDS TERMINATED BY ','
            ENCLOSED BY '"'
            LINES TERMINATED BY '\n'
            (ProjectName, YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)
        """
        dbcursor.execute(sql_query)
        database.commit()
        dbcursor.close()
        database.close()
        print("INFO: Importing to database is completed.")
    except Exception as e:
        print("Error: An error occurred while copying the file. " + str(e))


csvFileName="YAS_TBX_Bookings_Quotes_Count_Reports.csv"

addToDatabase(csvFileName)

# YAS_Bookings_Quotes_Count_Report (YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)
# YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts (YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)
# YAS_Component_Booking_Counts (YEAR, MONTH, BOOKING_COUNT, PRODUCT_CODE, CITY_CODE)
# YAS_Package_Bookings_Pre_builds_EP_and_DP 