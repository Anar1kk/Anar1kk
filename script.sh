               





                                   #!/bin/bash

function test {
  curl -sLo /dev/null -w "%{http_code}\t%{url_effective}\n" ${1}
}  
test mysite.com
test google.com
