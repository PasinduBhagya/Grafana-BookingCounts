import subprocess
from datetime import datetime, timedelta
from configparser import ConfigParser
import configparser
import traceback

config = ConfigParser()
config.read('./.env')

logTime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

def createEmailTemplateSend(projectName, toEmail):

    lastMonth = (datetime.today().replace(day=1) - timedelta(days=1)).strftime("%B %Y")

    sample_content = f'''<html>
                            <head></head>
                                <body>
                                    <strong>Hello all,</strong>
                                    <p>Please be advised that the {lastMonth} booking count data has not been fully loaded into the Pulse DB for the Project {projectName}. Please check for any network connectivity issues.</p>
                                    <p>Regards,</p>
                                    <p>Booking Count Monitoring System</p>
                                </body>
                        </html>'''

    command_to_send_email = [
        "mutt",
        "-e", "set content_type=text/html",
        "-s", f"Booking Count Failure - {projectName}",
        "--", toEmail
    ]

    mutt_process = subprocess.Popen(command_to_send_email, stdin=subprocess.PIPE)

    mutt_process.communicate(sample_content.encode())

    mutt_process.stdin.close()
    mutt_process.wait()

def sendEmailToPM(sendPMmailList):
    for projectName in sendPMmailList:
        try:
            toEmail = config.get('EMAIL_INFO', projectName)
            createEmailTemplateSend(projectName, toEmail)
        except configparser.NoOptionError:
            print(f"{logTime} Warning: No Email was found for {projectName}.")
        except Exception as e:
            print(f"Error: Sending email to {toEmail} has failed. Project Name - {projectName}")
            print("Exception:", e)
            traceback.print_exc()
     
        
