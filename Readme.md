### MINI DC INFRASTRUCTURE TEMPLATES  

```
sudo mount -t cifs //192.168.0.11/share /media/sharefolder -o username=windowsuser,password=windowspass,iocharset=utf8,file_mode=0777,dir_mode=0777
```
```
sudo grep 'nginx' /etc/gitlab/gitlab.rb | grep -v '^#'
```
```
firewall-cmd --permanent --zone=public --add-port=443/tcp
```
