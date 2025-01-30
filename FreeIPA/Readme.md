sudo hostnamectl set-hostname FQDN

vi /etc/hosts

192.168.1.100 ipa.dc.dc ipa

sudo timedatectl set-timezone Europe/Moscow

sudo firewall-cmd --add-service={freeipa-ldap,freeipa-ldaps,dns,ntp,http,https,kerberos} --permanent

sudo firewall-cmd --reload

sudo dnf install freeipa-server freeipa-server-dns freeipa-client -y

sudo ipa-server-install

NO DNS !
