#!/bin/bash

echo "Content-type:  text/html"
echo ""

echo '<html>'
#echo  '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />'
echo '<body>'

echo "Helo there<br />"
echo " Just testade<br /> "
echo "<hr>"
date 
date    >> /var/www/omx.utc/aaa.cgibol
echo "<hr>"

for f in /var/www/omx.utc/*_UTC;
#for f in *;
do
echo "<br />"

cat $f   >>  "/var/www/omx.utc.ark/"$(basename "$f") 


echo "concat :::"  $f  " ---  /var/www/omx.utc.ark/"$(basename "$f")     >> /var/www/omx.utc/aaa.cgibol

echo "concat :::"   $f " ---  /var/www/omx.utc.ark/"$(basename "$f")

#>>   /var/www/omx.utc/aaa.cgibol
echo "<br />"
#> /var/www/omx.utc/aaa.cgibol

mv  $f "/var/www/omx.utc.ark/zott/"$(basename "$f").$(date  +%Y-%m-%d-%H-%M)

done
echo "<br />"
echo "<hr>"

#zip /home/www/cgi-bin/aaa.zip /home/www/cgi-bin/*


#zip -j /var/www/omx.utc/zip.zipCGIBOL  /var/www/omx.utc/*_UTC*



#rm *_UTC*


echo '</body></html>'