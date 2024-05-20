from configparser import ConfigParser
from database import addToDatabase
import shutil
import os
from sendMail import sendEmailToPM
from datetime import datetime

config = ConfigParser()
config.read('./.env')

ProjectNames = config.get('PROJECTS', 'PROJECTS_LIST').split(',')
ProjectNamesOnDataDir = os.listdir("DATA/")
reAddToFromRetryList = []
sendPMmailList = []

logTime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

with open ("./.appdata/attemptNumber", "r") as aN:
    if aN.read().strip() == "":
        print(f"{logTime} INFO: Attempt Number is 0.")
        with open("./.appdata/attemptNumber", "w") as aNw:
            aNw.write("1")
            attemptNumber = 1
            print(f"{logTime} INFO: Attempt Number is set to 1.")
    else:
        with open ("./.appdata/attemptNumber", "r") as aN:   
            for number in aN:
                attemptNumber = int(number.strip())
                attemptNumber += 1
                print(f"{logTime} INFO: Attempt Number is {attemptNumber}.")

        with open ("./.appdata/attemptNumber", "w") as aN:
            aN.write(str(attemptNumber))
            print(f"{logTime} INFO: New Attempt Number is set to {attemptNumber}.")


if attemptNumber == 1:
    print(f"{logTime} INFO: Attempt Number: {attemptNumber}")
    for ProjectName in ProjectNames:
        ProjectName = ProjectName.strip()

        csvFileName = ProjectName + "_TBX_Bookings_Quotes_Count_Reports.csv"

        if csvFileName in ProjectNamesOnDataDir:
            try:
                addToDatabase(csvFileName, ProjectName)
                try:
                    shutil.move(f"DATA/{csvFileName}", "OLD-DATA/")
                except:
                    print("Error: Unable to move to the file to OLD-DATA directory.")
            except Exception as e:
                print(f"Error: Failed to add to Database." + str(e))

                with open("./.appdata/retryList", 'a') as retryList:
                    retryList.write(ProjectName + '\n')
        else:
            print(f"Error: {ProjectName} is not in the DATA Directory")
            with open("./.appdata/retryList", 'a') as retryList:
                    retryList.write(ProjectName + '\n')

elif attemptNumber > 1 and attemptNumber <= 3:
    print(f"INFO: Attempt Number: {attemptNumber}")
    with open("./.appdata/retryList", 'r') as retryList:
        for ProjectName in retryList:
            ProjectName = ProjectName.strip()
            csvFileName = ProjectName + "_TBX_Bookings_Quotes_Count_Reports.csv"

            if csvFileName in ProjectNamesOnDataDir:
                try:
                    addToDatabase(csvFileName, ProjectName)
         
                    try:
                        shutil.move(f"DATA/{csvFileName}", "OLD-DATA/")
                    except:
                        print("Error: Unable to move to the file to OLD-DATA directory.")
                        reAddToFromRetryList.append(ProjectName)
               
                except Exception as e:
                    print(f"Error: Failed to add to Database on {attemptNumber} attempt." + str(e))
                    reAddToFromRetryList.append(ProjectName)
            else:
                print(f"Error: {ProjectName} is not in the DATA Directory on {attemptNumber} attempt.")
                reAddToFromRetryList.append(ProjectName)

    print(f"{logTime} INFO: Following Projects failed on the {attemptNumber} - " + str(reAddToFromRetryList))
    with open("./.appdata/retryList", "w") as aL:
        for retryProName in reAddToFromRetryList:
            aL.write(retryProName + "\n") 
            
elif attemptNumber == 4:
    print(f"INFO: Attempt Number: {attemptNumber}")
    with open("./.appdata/retryList", 'r') as retryList:
        for ProjectName in retryList:
            ProjectName = ProjectName.strip()
            csvFileName = ProjectName + "_TBX_Bookings_Quotes_Count_Reports.csv"

            if csvFileName in ProjectNamesOnDataDir:
                try:
                    addToDatabase(csvFileName, ProjectName)
                    try:
                        shutil.move(f"DATA/{csvFileName}", "OLD-DATA/")
                    except:
                        print(f"Error: Unable to move to the file to OLD-DATA directory on {attemptNumber} attempt.")
               
                except Exception as e:
                    print(f"Error: Failed to add to Database {attemptNumber} attempt." + str(e))
                    sendPMmailList.append(ProjectName) 
                    
            else:
                print(f"Error: {ProjectName} is not in the DATA Directory {attemptNumber} attempt.")
                sendPMmailList.append(ProjectName)   
    print("INFO: Following PMs will receive Emails: " + str(sendPMmailList))
    sendEmailToPM(sendPMmailList)

    with open("./.appdata/retryList", "w") as aL:
        for retryProName in reAddToFromRetryList:
            aL.write("")
    
    with open("./.appdata/attemptNumber", "w") as aN:
        for retryProName in reAddToFromRetryList:
            aN.write("") 

else:
    print(f"{logTime} Error: Invalid Attempt Number ({attemptNumber}) or you have reached maxium attempt count.")