#!/bin/bash


# TELJES letoltese a fileoknak
###
konyvtar="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line.data/REALTIMEDAX_feldolgozas/"

###
KONYVT="/var/www/realtimedax.utc.ark/"

### egész letoltése Felülírással
### scp -P 2233 fujilakare8@89.134.14.161:/var/www/realtimedax.utc.ark/* $konyvtar 







feldolgozasJS ()  {



# eredeti fejlec valtozoba
echo "ragaszt           feldolgozasJS            " $1
elsosor=$(head -n1 $1 );
utsosor=$(tail -n1 $1 );

echo "ragaszt           feldolgozasJS parameter  "$2
echo 'var ticker'$2'="'$2'";'                   > ""$3""$2".js";


echo "var mydata"$2"= [    " $elsosor   >> ""$3""$2".js";
##### fejlesz nélkül         # utolso sor  nélkül
tail -n +2 $1  |   head -n -1           >> ""$3""$2".js";
echo $utsosor    "    ];"                >> ""$3""$2".js";

	
	
}



## UJH gépen:::::::::::::::::
###konyvtar="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line/"
konyvtar="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line.data/REALTIMEDAX_feldolgozas/"


KONYVT="/var/www/realtimedax.utc.ark/"




sorok_szama=''

for mit in "$konyvtar"*
do
ticker=$(basename "$mit")
echo  "ticker: "$ticker
sorok_szama=$(wc -l "$mit"  | cut -d ' ' -f1)

echo "sorok_szama:"$sorok_szama



cgi="checkout.sh"
curl http://89.134.14.161:8008/cgi-bin/$cgi\?namex=$sorok_szama\&namey=orvos\&namez=$ticker\&KONYVT=$KONYVT | grep "\["  >> $mit
###$konyvtar""$ticker


konyvtarJS="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line/"

feldolgozasJS $mit  $ticker  $konyvtarJS 

done





exit









