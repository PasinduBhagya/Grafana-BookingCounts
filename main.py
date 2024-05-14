from configparser import ConfigParser
from database import addToDatabase
# from sendMail import sendMail
import shutil
import os

config = ConfigParser()
config.read('./.env')

ProjectNames = config.get('PROJECTS', 'PROJECTS_LIST').split(',')
ProjectNamesOnDataDir = os.listdir("DATA/")

with open ("./.tmp/attemptNumber", "r") as aN:
    if aN.read().strip() == "":
        with open("./.tmp/attemptNumber", "w") as aNw:
            aNw.write("1")
    else:
        with open ("./.tmp/attemptNumber", "r") as aN:   
            for number in aN:
                attemptNumber = int(number)

if attemptNumber == 1:
    for ProjectName in ProjectNames:
        ProjectName = ProjectName.strip()

        projectNameFile = ProjectName + "_TBX_Bookings_Quotes_Count_Reports.csv"

        if projectNameFile in ProjectNamesOnDataDir:
            try:
                csvFileName=ProjectName + "_TBX_Bookings_Quotes_Count_Reports.csv"
                # addToDatabase(csvFileName, ProjectName)
                # Move the CSV file to Old Data
                shutil.move(f"DATA/{csvFileName}", "OLD-DATA/")
            except Exception as e:
                print(f"Error: Failed to add to Database." + str(e))
                print(f"Error: {ProjectName} is not in the DATA Directory")
                with open("retryList", 'a') as retryList:
                    retryList.write(ProjectName + '\n')
        else:
            print(f"Error: {ProjectName} is not in the DATA Directory")
            with open("retryList", 'a') as retryList:
                    retryList.write(ProjectName + '\n')

elif attemptNumber == 4:
    for ProjectName in ProjectNames:
        ProjectName = ProjectName.strip()

        projectNameFile = ProjectName + "_TBX_Bookings_Quotes_Count_Reports.csv"

        if projectNameFile in ProjectNamesOnDataDir:
            try:
                csvFileName=ProjectName + "_TBX_Bookings_Quotes_Count_Reports.csv"
                # addToDatabase(csvFileName, ProjectName)
                # Move the CSV file to Old Data
                shutil.move(f"DATA/{csvFileName}", "OLD-DATA/")
            except Exception as e:
                print(f"Error: Failed to add to Database." + str(e))
                with open("retryList", 'a') as retryList:
                    retryList.write(ProjectName + '\n')
        else:
            #mutt -s "Test 1 with Mutt" pasindub@codegen.net -a attachment.txt < body-test.txt
            sendEmail()

elif attemptNumber > 1:
    with open("retryList", 'a') as retryList:

    for ProjectName in retryList:

        projectNameFile = ProjectName + "_TBX_Bookings_Quotes_Count_Reports.csv"

        if projectNameFile in ProjectNamesOnDataDir:
            try:
                csvFileName=ProjectName + "_TBX_Bookings_Quotes_Count_Reports.csv"
                # addToDatabase(csvFileName, ProjectName)
                # Move the CSV file to Old Data
                shutil.move(f"DATA/{csvFileName}", "OLD-DATA/")
            except Exception as e:
                print(f"Error: Failed to add to Database." + str(e))
                with open("retryList", 'a') as retryList:
                    retryList.write(ProjectName + '\n')
        else:
            print(f"Error: {ProjectName} is not in the DATA Directory")
            with open("retryList", 'a') as retryList:
                retryList.write(ProjectName + '\n')
                attemptNumber += 1

else:
    print("Error: Invalid attempt ")