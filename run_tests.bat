@REM robot --output logs/output.xml --log logs/log.html --report logs/report.html tests/authentication/sign-in.robot

@REM robot --output logs/output.xml --log logs/log.html --report logs/report.html draft/capture-api.robot

@REM robot --output logs/output.xml --log logs/log.html --report logs/report.html tests/myAccount/profile.robot

robot -d logs tests\myAccount\change-password.robot
