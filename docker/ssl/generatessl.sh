sudo openssl genrsa -out "devcert.key" 2048
sudo openssl req -new -key "devcert.key" -out "devcert.csr"
sudo openssl x509 -req -days 365 -in "devcert.csr" -signkey "devcert.key" -out "devcert.crt"