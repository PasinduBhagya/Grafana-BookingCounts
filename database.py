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

def addToDatabase():
    database = connectToDatabase()
    dbcursor = database.cursor()

    try:
        # YAS,2022,JAN,2,5,0,0

        ProjectName = "YAS"
        YEAR = 2022
        MONTH = "JAN"
        BOOKING_COUNT = 2
        PAX_COUNT = 5
        QUOTE_COUNT = 0
        QUOTE_PAX_COUNT = 0
        
        sql_query = """INSERT INTO TBX_Bookings_Quotes_Count_Reports (ProjectName, YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
        values = (ProjectName, YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)

        dbcursor.execute(sql_query, values)
        database.commit()
        dbcursor.close()
        database.close()
        print("INFO: Adding to database is completed.")
    except Exception as e:
        print("Error: An error occurred while adding to the Database. " + str(e))


csvFileName="YAS_TBX_Bookings_Quotes_Count_Reports.csv"

addToDatabase()

# YAS_Bookings_Quotes_Count_Report (YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)
# YAS_Bookings_Quotes_Surf_or_TBX_Central_Pax_Counts (YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)
# YAS_Component_Booking_Counts (YEAR, MONTH, BOOKING_COUNT, PRODUCT_CODE, CITY_CODE)
# YAS_Package_Bookings_Pre_builds_EP_and_DP 