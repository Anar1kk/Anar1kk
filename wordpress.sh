   

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

