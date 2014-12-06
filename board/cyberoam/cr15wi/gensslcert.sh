#!/bin/bash

echo "Generating  SSL Cert"

make-ssl-cert /usr/share/ssl-cert/ssleay.cnf ./lighttpd.pem
