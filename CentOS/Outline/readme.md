- install outline server
- grep info about ports
- see your ports to open


```
sudo firewall-cmd --zone=public --add-port={port}/tcp --permanent
sudo firewall-cmd --zone=public --add-port={port}/tcp --permanent
```
```
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports
```

  
