wrire iso with dd
```
sudo dd if=ubuntu-22.04.5-desktop-amd64.iso of=/dev/sda bs=4M status=progress oflag=sync
```
sda - target disk
