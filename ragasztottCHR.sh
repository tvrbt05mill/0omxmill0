#!/bin/bash



konyvtarJS="/media/Lubuntuuuuu/VirtualBoxDisks_12_10_old_LUBUNTU/transfer/f/higstock_dwn/examples/basic-line/"

### ADS   ALV  ....
yarray=(ADS   ALV    BAS       BAYN       BEI       BMW       CBK       CON       DAI       DB1       DBK       DPW       DTE       EOAN       FME       FRE       HEI       HEN3       IFX       LHA       LIN       LXS       MRK       MUV2       RWE       SAP       SDF       SIE       TKA       VOW3)
Aarray=(ADS   ALV    BAS       BAYN       BEI       BMW)
Carray=(CBK       CON       DAI       DB1       DBK       DPW       DTE  )
Earray=(EOAN       FME       FRE       HEI       HEN3)
Iarray=(IFX       LHA       LIN       LXS       MRK       MUV2)
array=(RWE       SAP       SDF       SIE       TKA       VOW3)


megjelenit()  {




# Iterate through the array
for ((i=0;i<${#array[*]};i++)); do
#### echo "$i : ${array[$i]}"
####                mit            _UTC       KONYVT= 
echo "chromium-browser" "$konyvtarJS""000"${array[$i]}".html"
sleep 5
chromium-browser  -new-tab "$konyvtarJS""000"${array[$i]}".html" &
done
echo "---------------------------------"

#Read more: http://linuxpoison.blogspot.hu/2012/06/bash-script-array-examples-and.html#ixzz2xNf5XdSJ
}

html_sida_kieg() {
	
# Iterate through the array
for ((i=0;i<${#array[*]};i++)); do
#### echo "$i : ${array[$i]}"
####                mit            _UTC       KONYVT= 
echo ""
echo ""
echo      "$konyvtarJS""000"${array[$i]}".html"
echo "******************************************"
tail -n 6 "$konyvtarJS""000"${array[$i]}".html" 
done
echo "---------------------------------"
	
	
}

html_sida_kieg
