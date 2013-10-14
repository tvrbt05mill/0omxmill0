#!/bin/bash


#cd /home/fujilakare/kindlegen/wget
cd /home/fujilakare5/tvrboot

datu=$(date)

wget "http://users.atw.hu/tvrbt/gethint2.php?q=""$datu"  -O wget_mentett.html
#van=$(cat  ./wget_mentett.html | grep Brittany )
#echo $van


if $(cat  ./wget_mentett.html | grep -q tvrboot )
then
 echo "Brittany csokoltat!" 
 #date  >> wget_mentett.reboot 
 echo $(date) "Brittany csokoltat!"  >> wget_mentett.reboot
rm  ./wget_mentett.html





 cd /home/fujilakare5

# ./tvshutdown.sh :

#if [ -f /var/www/tmp/tvreboot ];
#then
echo "x - x - x - x - x - x - x - x" >> /var/www/tmp/tvreboot.log
echo $(date)  "   webrol.php-val WEB REBOOT"                       >> /var/www/tmp/tvreboot.log
#echo $(date)                         >> /var/www/tmp/tvreboot.log
echo "/var/www/tmp/tvreboot exists!" >> /var/www/tmp/tvreboot.log
#rm /var/www/tmp/tvreboot
sudo shutdown -r now  >>   /var/www/tmp/tvreboot.log
echo "vegegegegegx - x - x - x - x - x - x - x" >> /var/www/tmp/tvreboot.log

#fi

 
 
 #echo "                                 "  >> wget_mentett.reboot
else
   echo "Brittany nincs itthon"    
      echo $(date) "Brittany nincs itthon"    > wget_mentett.eele

fi
