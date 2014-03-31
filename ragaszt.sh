#!/bin/bash

##  "_UTC"  file véget átadjuk a ARGY paraméternek már itt

##############s_dbg on 





feldolgozasJS ()  {
# eredeti fejlec valtozoba
echo " S S S S S S S S S S S S S S S S S S S S S S "
echo " S S S S S S S S S S S S S S S S S S S S S S "
echo " S S S S S S S S S S S S S S S S S S S S S S "
echo " S S S S S S S S S S S S S S S S S S S S S S "
echo " S S S S S S S S S S S S S S S S S S S S S S "
echo "ragaszt           feldolgozasJS            " $1   $2   $3   $4
elsosor=$(head -n1 $1 );
utsosor=$(tail -n1 $1 );

echo "ragaszt           feldolgozasJS parameter  "$2
echo 'var ticker'$2'="'$2'";'                   > ""$3""$2".js";


echo "var mydata"$2"= [    " $elsosor   >> ""$3""$2".js";
##### fejlesz nélkül         # utolso sor  nélkül
tail -n +2 $1  |   head -n -1           >> ""$3""$2".js";
echo $utsosor    "    ];"                >> ""$3""$2".js";

	
	
}


concatragaszt() {

#concatragaszt  ${array[$i]}  $_UTCtag     $KONYVTtag  $konyvtartag
mit=$1
#_UTC=$2
#KONYVT=$3
#### _UTC="_UTC"
#konyvtar=$4
#konyvtar="/media/fujilakare5/XXXhomokozo/highchart_dwn/examples/basic-line.data/OMX_DAX_feldolgozas/"


## UJH gépen:::::::::::::::::
##OMX DAX
###konyvtar="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line.data/OMX_DAX_feldolgozas/"

## ADS   ALV  ....
# OLD   konyvtar="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line.data/realtimedax_feldolgozas/UTC_es_tombok_js_alakitasa/data/"
##konyvtar="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line.data/UTC_es_tombok_js_alakitasa/fardig/"

## OMX DAX
#### for mit in DAX OMXSPI

## ADS   ALV  ....
##for mit in ADS   ALV    BAS       BAYN       BEI       BMW       CBK       CON       DAI       DB1       DBK       DPW       DTE       EOAN       FME       FRE       HEI       HEN3       IFX       LHA       LIN       LXS       MRK       MUV2       RWE       SAP       SDF       SIE       TKA       VOW3 

#### do
sorok_szama=$(wc -l "$konyvtar""$mit"  | cut -d ' ' -f1)
echo "ragaszt          + + + + + + + + + + + + + + + + + + + + + + + + + + +:  " 
echo "ragaszt          + + + + + + + + + + + + + + + + + + + +:  " 
echo "ragaszt          for LOOP"
echo "ragaszt         "$sorok_szama    $mit    $konyvtar$mit
echo "ragaszt          + + + + + + + + tomma.sh  INDULNA"

cgi="tomma.sh"
curl http://89.134.14.161:8008/cgi-bin/$cgi
echo "ragaszt          + + + + + + + + tomma.sh  VÉGEEEE"

###sorok_szama=1
#HA sorok 1 töl indulnak, 
# ki kel törölni az előző
# már meglevő FILE-!!!
###rm $konyvtar""$mit






echo "ragaszt          + + + + + + + +     checkout.sh   INDULNA"

cgi="checkout.sh"
##################curl http://192.168.0.190:8008/cgi-bin/$cgi\?namex=$sorok_szama\&namey=orvos\&namez=$mit\&KONYVT=\/var\/www\/omx.utc.ark\/  
##################curl http://127.0.0.1/cgi-bin/$cgi\?namex=$sorok_szama\&namey=orvos\&namez=$mit\&KONYVT=$KONYVT 


## OMX DAX   és     "_UTC"-és
####KONYVT="/var/www/omx.utc.ark/"

echo " M M M M M M M M M M M M M M M M M M M M M M M"
echo " M M M M M M M M M M M M M M M M M M M M M M M"
echo " M M M M M M M M M M M M M M M M M M M M M M M"
echo " M M M M M M M M M M M M M M M M M M M M M M M"
echo "              mit    _UTC      KONYVT       konyvtar"
echo                $mit  $_UTC     $KONYVT       $konyvtar 

curl http://89.134.14.161:8008/cgi-bin/$cgi\?namex=$sorok_szama\&namey=orvos\&namez=$mit$_UTC\&KONYVT=$KONYVT | grep "\[" >> $konyvtar""$mit


## ADS   ALV  ....
##KONYVT="/var/www/realtimedax.utc.ark/"
##curl http://rvs.dyndns.dk:8008/cgi-bin/$cgi\?namex=$sorok_szama\&namey=orvos\&namez=$mit\&KONYVT=$KONYVT | grep "\[" >> $konyvtar""$mit

echo "ragaszt          + + + + + + + +     checkout.sh  VÉGEEEEEEE"
echo "ragaszt          + + + + + + + +          checkout.sh   feldolgozasJS()   INDULNA"




#konyvtarJS="/media/fujilakare5/XXXhomokozo/highchart_dwn/examples/basic-line/"

##OMX DAX
## ADS   ALV  ....
konyvtarJS="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line/"

### feldolgozasJS $konyvtar$mit  $mit  $konyvtarJS
echo "ragaszt          + + + + + + + +          $konyvtar     "
echo "ragaszt          + + + + + + + +          $4"
echo "ragaszt          + + + + + + + +          $konyvtar"
echo "ragaszt          + + + + + + + +          $konyvtar"
echo "ragaszt          + + + + + + + +          $konyvtar"
echo "ragaszt          + + + + + + + +          $konyvtar"
feldolgozasJS $konyvtar$mit $mit  $konyvtarJS  $konyvtar
echo "ragaszt          + + + + + + + +          checkout.sh   feldolgozasJS()   VEGGEEE"

#### done
}




xarray=(DAX OMXSPI)
##OMX DAX
###konyvtar="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line.data/OMX_DAX_feldolgozas/"
xkonyvtar="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line.data/OMX_DAX_feldolgozas/"
xKONYVTtag="/var/www/omx.utc.ark/"
x_UTCtag="_UTC"

### ADS   ALV  ....
yarray=(ADS   ALV    BAS       BAYN       BEI       BMW       CBK       CON       DAI       DB1       DBK       DPW       DTE       EOAN       FME       FRE       HEI       HEN3       IFX       LHA       LIN       LXS       MRK       MUV2       RWE       SAP       SDF       SIE       TKA       VOW3)
array=(BAS BAYN)
#konyvtartag="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line.data/REALTIMEDAX_feldolgozas/"
konyvtar="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line.data/REALTIMEDAX_feldolgozas/"
#_UTCtag=""
_UTC=""
#KONYVTtag="/var/www/realtimedax.utc.ark/"
KONYVT="/var/www/realtimedax.utc.ark/"



# Iterate through the array
for ((i=0;i<${#array[*]};i++)); do
#### echo "$i : ${array[$i]}"
####                mit            _UTC       KONYVT= 
echo "V V V V V V V V V VV V V V V V V V V V V V V VV V V V V V V "
echo "V V V V V V V V V VV V V V V V V V V V V V V VV V V V V V V "
echo "V V V V V V V V V VV V V V V V V V V V V V V VV V V V V V V "
echo "concatragaszt  " ${array[$i]}  $_UTCtag     $KONYVTtag  $konyvtartag
concatragaszt  ${array[$i]}  $_UTCtag     $KONYVTtag  $konyvtartag
echo                ${array[$i]}  $_UTCtag     
done
echo "---------------------------------"

#Read more: http://linuxpoison.blogspot.hu/2012/06/bash-script-array-examples-and.html#ixzz2xNf5XdSJ


