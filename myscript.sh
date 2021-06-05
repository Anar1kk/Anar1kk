#! /bin/bash


status="$(systemctl is-active httpd.service)"
if [ "${status}" = "active" ]; then
  ps aux | grep httpd
    else 
 systemctl start httpd.service ; tail /var/log/httpd/error_log >> error.log.httpd
 exit 0
fi

