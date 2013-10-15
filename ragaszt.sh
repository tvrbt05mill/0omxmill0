#!/bin/bash



feldolgozasJS ()  {
# eredeti fejlec valtozoba
echo "11111111111SSSSSSSSSSS:" $1
elsosor=$(head -n1 $1 );
utsosor=$(tail -n1 $1 );

echo "2222222222222-es parameter "$2
echo 'var ticker'$2'="'$2'";'                   > ""$3""$2".js";


echo "var mydata"$2"= [    " $elsosor   >> ""$3""$2".js";
##### fejlesz nélkül         # utolso sor  nélkül
tail -n +2 $1  |   head -n -1           >> ""$3""$2".js";
echo $utsosor    "    ];"                >> ""$3""$2".js";

	
	
}




konyvtar="/media/fujilakare5/XXXhomokozo/highchart_dwn/examples/basic-line.data/OMX_DAX_feldolgozas/"


for mit in DAX OMXSPI
do
sorok_szama=$(wc -l "$konyvtar""$mit"  | cut -d ' ' -f1)
echo $sorok_szama    $mit    $konyvtar$mit

cgi="tomma.sh"
curl http://192.168.0.190:8008/cgi-bin/$cgi

cgi="checkout.sh"
curl http://192.168.0.190:8008/cgi-bin/$cgi\?namex=$sorok_szama\&namey=orvos\&namez=$mit   | grep "\[" >> $konyvtar""$mit



konyvtarJS="/media/fujilakare5/XXXhomokozo/highchart_dwn/examples/basic-line/"

feldolgozasJS $konyvtar$mit  $mit  $konyvtarJS 




done
