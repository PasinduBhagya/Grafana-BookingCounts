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

def addToDatabase(csvFileName, ProjectName):
    database = connectToDatabase()
    dbcursor = database.cursor()
    with open(f"DATA/{csvFileName}", 'r') as resultFile:
        for line in resultFile:
            try:
                dataInLine =  line.split(",")
		
                ProjectName = ProjectName
                YEAR = dataInLine[0].strip()
                MONTH = dataInLine[1].strip()
                BOOKING_COUNT = dataInLine[2].strip()
                PAX_COUNT = dataInLine[3].strip()
                QUOTE_COUNT = dataInLine[4].strip()
                QUOTE_PAX_COUNT = dataInLine[5].strip()
                
                sql_query = """INSERT INTO tbx_bookings_quotes_count_reports (ProjectName, YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
                values = (ProjectName, YEAR, MONTH, BOOKING_COUNT, PAX_COUNT, QUOTE_COUNT, QUOTE_PAX_COUNT)
                dbcursor.execute(sql_query, values)
                print("INFO: Adding to database is completed.")
                database.commit()
            except Exception as e:
                print("Error: An error occurred while adding to the Database. " + str(e))    
    
    dbcursor.close()
    database.close()