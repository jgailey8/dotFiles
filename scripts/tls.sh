#!/bin/bash
## Author: Bob Saska (r35krag0th) <git@r35.net>

openssl s_client -connect tuner.pandora.com:443 < /dev/null 2> /dev/null | \
    
openssl x509 -noout -fingerprint | tr -d ':' | cut -d'=' -f2 


# echo |\
# openssl s_client -connect tuner.pandora.com:443 2>&1 |\
# sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' |\
# openssl x509 -noout -fingerprint |\
# sed 's/://g' |\
# cut -d= -f2 | read fingerprint
# echo "The fingerprint is: $fingerprint."
# piano -cv "set tls fingerprint \"$fingerprint\""
#
piano -cv "set tls fingerprint FC2E6AF49FC63AEDAD1078DC22D1185B809E7534"
