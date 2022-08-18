**Q**: I have Traefik warning `permissions 777 for acme.json are too open, please use 600`. WTF?

**A**:
It's probably error on Windows 10 WSL system.
For enable to changing file permissions create a file `/etc/wsl.conf` on WSL with content:
```
[automount]
enabled = true
root    = /mnt/
options = "metadata,umask=22,fmask=11"
```

Details can be found [here](https://superuser.com/questions/1323645/unable-to-change-file-permissions-on-ubuntu-bash-for-windows-10).
