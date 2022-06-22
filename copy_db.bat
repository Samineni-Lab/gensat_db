set user=root
set password=root

if NOT "%1"=="" set user=%1
if NOT "%2"=="" set password=%2

mysql -u %user% --password=%password% -e "CREATE DATABASE IF NOT EXISTS gensat;"
mysql -u %user% --password=%password% gensat < .\data\gensat_for_public.sql