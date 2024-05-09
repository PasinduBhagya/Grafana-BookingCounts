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
    dbcursor = database.cursor()
    with open(f"SAMPLE_DATA/{csvFileName}", 'r') as resultFile:
        for line in resultFile:
            dataInLine =  line.split(",")
            try:
                ProjectName = dataInLine[0].strip()
                YEAR = dataInLine[1].strip()
                MONTH = dataInLine[2].strip()
                BOOKING_COUNT = dataInLine[3].strip()
                PAX_COUNT = dataInLine[3].strip()
                QUOTE_COUNT = dataInLine[4].strip()
                QUOTE_PAX_COUNT = dataInLine[5].strip()
                
                sql_query = """INSERT INTO TBX_Bookings_Quotes_Count_Reports (ProjectName, YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
                values = (ProjectName, YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)
                dbcursor.execute(sql_query, values)
                print("INFO: Adding to database is completed.")
                database.commit()
            except Exception as e:
                print("Error: An error occurred while adding to the Database. " + str(e))
    
    
    dbcursor.close()
    database.close()


csvFileName="YAS_TBX_Bookings_Quotes_Count_Reports.csv"

addToDatabase(csvFileName)

# YAS_Bookings_Quotes_Count_Report (YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)
# YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts (YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)
# YAS_Component_Booking_Counts (YEAR, MONTH, BOOKING_COUNT, PRODUCT_CODE, CITY_CODE)
# YAS_Package_Bookings_Pre_builds_EP_and_DP 