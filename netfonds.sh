#!/bin/bash
# ver:
#	  2013.10.16  ::CGI-be airva 
#	  		UTC_zes_netfondson.sh
#


#	  UNIXTtimestamp_130929_1_0	::  Letöltött netfonds fileokbol 
#									UTC-es 
#									datumozás előeállítása





echo "Content-type:  text/html"
echo ""

echo '<html>'
echo  '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />'
echo '<body>'

echo "Helo there<br />"
echo " Just testade<br /> fraon $0<br />"
echo "<hr>"
#echo "CCCCCCCCC3333333CCCCCCCCCCCCCCCCCCCC"d
#echo  "</body>" 
#echo "</html>"
#exit

#scp fujilakare5@192.168.3.190:nagyobbak/* ./zando/netfonds/


KONYVTAR="/var/www/netfonds.utc/UTC_zes_netfondson/"



# Get time as a UNIX timestamp (seconds elapsed since Jan 1, 1970 0:00 UTC)
echo "" >>   $KONYVTAR"netfonds.log"
date >>   $KONYVTAR"netfonds.log"
T="$(date +%s)"


feldolgozas () {

rm $KONYVTAR"data";

sorok=$(wc -l $1);
aktie_nev=$(head -n1 $1 | cut -d \, -f1); 
echo "<hr> <br>1 YYYYYYYYY  <b>feldolgozas()</b>-ból aktie_nev: "$aktie_nev "<br />";

#


# dátum kiszedése a FILENÉVhez
# utso sor DATUM érdekes
tf=$(tail -n1 $1 | cut -d \, -f2); 
yf=$(echo $tf | cut -c 1-4); 
mf=$(echo $tf | cut -c 5-6); 
df=$(echo $tf | cut -c 7-8); 

#aktie=$aktie_f"_"$yf"_"$mf"_"$df; 


#echo "aktie_f:"$aktie_f;

#echo "aktie:"$aktie;



# tisztitás, mert vaannak odanemillők
sed -i '/Belgie/d' $1
sed -i '/%/d'      $1;
sed -i '/;;;;/d'   $1;

sed -i '/-\//d'   $1;




num=1;
tail -n+2 $1 | while read line ; 
do 
				
				#num=`expr $num1 + $num2`
			#or

			#num=$(($num1 + $num2))

			#for floating point nums:

			#num=$(echo $num1 + $num2 | bc)


num=$(($num + 1));
mar=$(($num % 100));
if [ $mar -eq 0 ];
then
echo "<br>sor:"$num"/"$sorok"</br>";
fi;


#aktie=$(echo $line | cut -d , -f1); 

t=$(echo $line | cut -d \, -f2); 
y=$(echo $t | cut -c 1-4); 
m=$(echo $t | cut -c 5-6); 
d=$(echo $t | cut -c 7-8); 
#echo $line\;$(date -d "$t" "+%s") ; 
#echo  $t "  "  $y "  "  $m "   "  $d ;

tt=$(echo $line | cut -d \, -f3); 
o=$(echo $tt | cut -c 1-2); 
p=$(echo $tt | cut -c 3-4); 
s=$(echo $tt | cut -c 5-6); 
#echo  $o "  "  $m "  "  $s  ;


priset=$(echo $line | cut -d \, -f4); 
quanty=$(echo $line | cut -d \, -f5); 


ss=$m"/"$d"/"$y" "$o":"$p":"$s ;

echo "["$(TZ=GMT+0 date -d "$ss" "+%s")"000,"$priset","$quanty",'"$t"-"$tt"'],"   >> $KONYVTAR"data"
#echo "<hr>["$(TZ=GMT+0 date -d "$ss" "+%s")"000,"$priset","$quanty",'"$t"-"$tt"'],"   


done 



cp $KONYTAR"data"    ""$ZOTT""$aktie_nev""$yf""$mf""$df; 

#echo -n "prompt"  #'-n' means do not add \n to end of string
#read -p "folyt valami biill"             # No arg means dump next line of input

if [ ! -f  $FARDIG""$aktie_nev ]; then
    echo "File MÉG not found!"

	cp  $KONYVTAR"data"     $FARDIG""$aktie_nev
	
else
	echo "File  MÁR found!"

    cat $KONYVTAR"data"  >>  $FARDIG""$aktie_nev
	
fi



# incs fejléc
# nincs UTSO vessző leszedése
#head -n-1 data  >>  $aktie; 
#tail -n 1 data  | sed s/],/]/  >>  $aktie; 

echo "<b>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"$1 ""$ZOTT""$3"</b>"


mv  $1 ""$ZOTT""$3""
}

#müxik

minta=$(TZ=GMT+0 date  -d '04/25/2008 00:00:00' +%s) ; 
echo "minta:" $minta;
TZ=GMT+0 date --date='04/25/2008 00:00:00'   +"%s";













  



  FARDIG="/var/www/netfonds.utc/UTC_zes_netfondson/fardig/"  
ZANDO_01="/var/www/netfonds.utc/UTC_zes_netfondson/zando/netfonds/nagyobbak/*.csv";
    ZOTT="/var/www/netfonds.utc/UTC_zes_netfondson/zott/";

for f in $ZANDO_01
#for f in  /var/www/netfonds.utc/UTC_zes_netfondson/zando/netfonds/nagyobbak/AAK-20131014.csv
do
  echo "<hr><h1>FELDOLGOZAS()  $f file...  </H1>"$ZANDO_01
  # feldolgozas ${f%%.*}  # ez a filenev lekérése
  kortname=`echo $(basename "$f") | cut -d "-"  -f1  `
echo "<br><i><b>kortname:" $kortname"</b></i></br>"
echo "<br><i>file: "$f"</i></br>"
echo "<hr>head tail "
head $f -n2
echo "<br /> "
tail $f -n2
echo "<br>   x - . - x - . - x - . - x - . - x </br>"
echo "jelenleg feld. alatt::<html><body><hr>"$(date)"</br><br> ::"$(basename "$f")"</body></html>"	 > $KONYVTAR"felgalatt.html"



feldolgozas $f  $kortname  $(basename "$f")



echo "<hr><hr>"
done  
  # end for f in $FILES
echo "<hr><h1>FELDOLGOZAS()  $f file...  VÉGE</H1>"$ZANDO_01
  echo "<hr>"






echo "<hr>"
feldolgozasJS ()  {
# eredeti fejlec valtozoba

elsosor=$(head -n1 $1 );
utsosor=$(tail -n1 $1 );

echo "2222222222222-es parameter "$2"   "
echo 'var ticker'$2'="'$2'";'                   > ""$FARDIGJS""$2".js";


echo "var mydata"$2"= [    " $elsosor   >> ""$FARDIGJS""$2".js";
##### fejlesz nélkül         # utolso sor  nélkül
tail -n +2 $FARDIG$2  |   head -n -1           >> ""$FARDIGJS""$2".js";
echo $utsosor    "    ];"                >> ""$FARDIGJS""$2".js";

	
	
}






FARDIG="/var/www/netfonds.utc/UTC_zes_netfondson/fardig/"  


FARDIGJS="/var/www/netfonds.utc/UTC_zes_netfondson/fardigJS/"

SCRIPTNEVEK="000scripts"  
TOMBNEVEK="000tombok"  
SELECTEK="000select"  
IFEK="000ifek"  


echo 'xxx' > $FARDIGJS$SCRIPTNEVEK
echo  'var tomb = {'  > $FARDIGJS""$TOMBNEVEK
echo  '<select id="selectem" multiple>'  > $FARDIGJS$SELECTEK
echo '' > $FARDIGJS$IFEK

echo "katalogizalas..."$FARDIG"*.js"





for f in $FARDIG*  
#for f in ./fardig/*
do
echo "f:" $f
echo "basename:"`basename $f`
  kortname=$( basename $f | cut -d "."  -f1  )
  
  echo "kortname:XXXXXXXXXXXXXX" $kortname
  echo '<SCRIPT  SRC="'$kortname'.js" TYPE="text/javascript"></SCRIPT> '	  >> ""$FARDIGJS""$SCRIPTNEVEK
  echo '"'$kortname'": mydata'$kortname','                          	  >> ""$FARDIGJS""$TOMBNEVEK
  echo '<option value="'$kortname'">'$kortname'</OPTION> '	  >> ""$FARDIGJS""$SELECTEK
  echo "					if (\$('#selectem').val()=='"$kortname"') {"	  >> $FARDIGJS$IFEK
  echo "					     chart.addSeries({"	                              >> $FARDIGJS$IFEK
  echo "					     data: mydata"$kortname	  >> $FARDIGJS$IFEK
  echo "					     })"	  						>> $FARDIGJS$IFEK
  echo "					     };"	  						>> $FARDIGJS$IFEK
  
  

echo "<br>feldolgozasJS<b>JS</b></br>"  
feldolgozasJS $f  $kortname

  				

done  
  # end for f in $FILES


echo "" >> $FARDIGJS$SCRIPTNEVEK
echo  "}"  >> $FARDIGJS$TOMBNEVEK
echo  '</select>'  >> $FARDIGJS$SELECTEK

#read -p "bill leüt..."


echo "<br>feldolgozasJS<b>JS    VÉGE</b></br>"  



  





T="$(($(date +%s)-T))"
echo "<hr><br>Time in seconds: ${T}</b>"   >>  $KONYVTAR"netfonds.log"
echo "<hr><br>Time in seconds: ${T}</b>"   

printf "<hr>Pretty format: %02d:%02d:%02d:%02d\n" "$((T/86400))" "$((T/3600%24))"  "$((T/60%60))"  "$((T%60))"  >>  $KONYVTAR"netfonds.log"
printf "<hr>Pretty format: %02d:%02d:%02d:%02d\n" "$((T/86400))" "$((T/3600%24))"  "$((T/60%60))"  "$((T%60))"  



echo "</body>" 
echo "</html>"
exit 


exit




exit
/var/www/netfonds.utc/UTC_zes_netfondson/zando/netfonds/ACAP_A-20131015.csv
