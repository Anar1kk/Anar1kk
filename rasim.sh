

       #! bin/bash

                                
                             pong=`ping -w3 8.8.8.8`
if [ ${pong} ]
then 
echo "elasan"
exit 0
else echo “fail”
 
