   #!bin/bash 
            code=`curl -I https://xebers.com`
                    if [ {$code} == 'HTTP/1.1 200 OK' ];

                   then

                     echo "zoooor"
                    else
                     
                     echo "qaqa"
                fi


