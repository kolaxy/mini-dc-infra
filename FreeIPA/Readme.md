sudo timedatectl set-timezone Europe/Moscow

sudo hostnamectl set-hostname FQDN

vi /etc/hosts

192.168.1.100 ipa.dc.dc ipa

sudo firewall-cmd --add-service={freeipa-ldap,freeipa-ldaps,dns,ntp,http,https,kerberos} --permanent

sudo firewall-cmd --reload

sudo dnf install freeipa-server freeipa-server-dns freeipa-client -y

sudo ipa-server-install

NO DNS !

CA CENTER IPA:

TARGET HOST
 openssl req -new -newkey rsa:2048 -nodes -keyout gitlab.key -out gitlab.csr -subj "/CN=gitlab.cloud.lan"

IPA HOST
ipa cert-request gitlab.csr --principal=host/gitlab.cloud.lan




_____

sudo systemctl status ipa
