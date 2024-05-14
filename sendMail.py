import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from datetime import date
from configparser import ConfigParser

config = ConfigParser()
config.read('./configurations.cfg')

email_content = "/path/to/html"

def sendEmail(agent_ip, email_content):
    smtp_server = config.get('SMTP_CONFIGURATIONS', 'SMTP_SERVER')
    smtp_port = config.get('SMTP_CONFIGURATIONS', 'SMTP_PORT')
    sender_email = config.get('SMTP_CONFIGURATIONS', 'SMTP_SENDER_EMAIL')
    sender_password = config.get('SMTP_CONFIGURATIONS', 'SMTP_SENDER_PASSWORD')
    recipient_email = config.get('SMTP_CONFIGURATIONS', 'RECEPTION_EMAIL')

    subject = f"Failed to Load Data to Pulse" + str(date.today())

    message = MIMEMultipart()
    message['Subject'] = subject
    message['From'] = sender_email
    message['To'] = recipient_email

    message.attach(MIMEText(email_content, 'html'))

    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.starttls()
        server.login(sender_email, sender_password)
        server.sendmail(sender_email, recipient_email, message.as_string())

    