@REM robot --output logs/output.xml --log logs/log.html --report logs/report.html tests/authentication/sign-in.robot

@REM robot --output logs/output.xml --log logs/log.html --report logs/report.html draft/capture-api.robot

@REM robot --output logs/output.xml --log logs/log.html --report logs/report.html tests/myAccount/profile.robot

@REM robot -d logs tests\user-management\create-user.robot
@REM robot -d logs tests\myAccount\profile.robot
robot -d logs tests\authentication\signin.robot