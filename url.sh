  #!/bin/bash

# cd to directory where the MaxMind database is to be downloaded.
if ! cd /home/example/public_html/billing/system/; then
echo "Can't find work directory" >&2
exit 1
fi

# Remove existing files so we start off with a clean set of updated data from Maxmind.
 
rm -f GeoLite*
rm -f md5sum.txt

# Download databases and if applicable, their md5s.

curl -L https://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz | gunzip > GeoLiteCity.dat
curl -L https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz | gunzip > GeoLite2-City.dat
curl -O https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.md5

# Create md5sum of the GeoLite2 database.
md5sum < GeoLite2-City.dat > md5sum.txt
# Strip out the spurious - seen in md5sum.txt
sed -i 's/ .*//' md5sum.txt

# Set what files are what for file comparison purposes.
file1="md5sum.txt"
file2="GeoLite2-City.md5"

# DO THE THING! ie, compare!
if ! cmp --silent "$file1" "$file2"; then
mail -s "Results of GeoLite Updates" example@domain.com <<< "md5sum for GeoLite2-City failed. Please check the md5sum. File may possibly be corrupted."
fi
