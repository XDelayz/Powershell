# Скрипт массово создает пользователей на сервер Windows и добавляет их в группу Пользователи удаленного рабочего стола
# При необходимости количество можно увеличить или изменить User001,AtEtpd4hsiV1 на свои значения.

Set-ExecutionPolicy RemoteSigned -Force # отключение политики которая не позволяла запускать скрипты.
echo '$TXT = Import-csv C:\Users\Administrator\Downloads\users.txt
foreach($LINE in $TXT)
{
$NewUser="$($LINE.USERNAME)"
$NewPass="$($LINE.PASSWORD)" 
$SecurePass=ConvertTo-SecureString –AsPlainText -Force -String "$NewPass"
New-LocalUser -Name $NewUser -Password $SecurePass
}
$TXT = Import-csv C:\Users\Administrator\Downloads\users.txt
foreach($LINE in $TXT)
{
$NewUser="$($LINE.USERNAME)"
Add-LocalGroupMember -Group "Пользователи удаленного рабочего стола" -Member $NewUser
}' *> C:\Users\Administrator\Downloads\Scripoos.ps1
echo "USERNAME,PASSWORD
User001,AtEtpd4hsiV1
User002,AtEtpd4hsiV2
User003,AtEtpd4hsiV3
User004,AtEtpd4hsiV4
User005,AtEtpd4hsiV5"  *> C:\Users\Administrator\Downloads\users.txt

C:\Users\Administrator\Downloads\Scripoos.ps1
