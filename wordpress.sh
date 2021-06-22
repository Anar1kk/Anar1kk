 #!/bin/bash
  #update OS
  yum -y update
  #install webServer HTTPD(apache)
  yum -y install httpd
  systemctl start httpd.service
  systemctl enable httpd.service
  #install repo
  yum -y install epel-release
  yum -y install wget
  #install DB(mysql)
  yum -y install mariadb  mariadb-server
  systemctl start mariadb
  systemctl enable mariadb
  #install PHP7.4
  yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
  yum -y install yum-utils
  yum-config-manager --enable remi-php74
  yum -y install php php-cli
  yum -y install php  php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json
  
  clear
  WORDPRESS_URL="https://wordpress.org/latest.tar.gz"

 # GET ALL USER INPUT
 echo "Project folder name?"
 read PROJECT_FOLDER_NAME

 echo "Project Source Url (eg. /var/www/html/wordpress)?"
 read PROJECT_SOURCE_URL

 echo "Setup wp_config? (y/n)"
 read SHOULD_SETUP_DB

 if [ $SHOULD_SETUP_DB = 'y' ]
 then
        echo "DB Name"
        read DB_NAME

        echo "DB Username"
        read DB_USERNAME
        echo "DB Password"
        read DB_PASSWORD
fi

#LETS START INSTALLING
echo "Sit back and relax :) ......"

# CREATE PROJECT DIRECTORIES
cd /var/www/html/
echo "Creating $PROJECT_FOLDER_NAME"

# DOWNLOAD WORDPRESS
echo "Downloading Wordpress"
wget $WORDPRESS_URL

# UNZIP WORDPRESS AND REMOVE ARCHIVE FILES
echo "Unzipping Wordpress"
tar xzvf latest.tar.gz

if [ $SHOULD_SETUP_DB = 'y' ]
then
        # SETUP WP CONFIG

  echo "Create wp_config"
        cd /var/www/html/wordpress
        mv wp-config-sample.php wp-config.php
        sed -i bak -e "s/database_name_here/$DB_NAME/" wp-config.php
        sed -i bak -e "s/username_here/$DB_USERNAME/" wp-config.php
        sed -i bak -e "s/password_here/$DB_PASSWORD/" wp-config.php

fi

echo "All done...i"
 chown -R apache:apache /var/www/html/*

