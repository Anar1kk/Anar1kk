#! /bin/bash

read -p "elave et:" var_a

read -p "elave et:" var_b

echo "xosh geldin menim proqrammima"

echo "axtar..."

sleep 5

if [ $var_a ];
then
	for i in /etc/;
	do
		find /etc -size +$var_a > /root/script;
	done;
elif
	[ $var_b ];
then

	for i in /etc/;
	do
		find /etc -size -$var_b >> /root/script;
	done;
	
	else
		echo "bele bir wey tapilmadi"
fi


