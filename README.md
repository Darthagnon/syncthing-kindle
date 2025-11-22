Setup Syncthing on Kindle (KUAL)
================================

1. You need a jailbreak and [KUAL](http://www.mobileread.com/forums/showthread.php?t=203326) first.
2. Download [this repository](https://github.com/Darthagnon/syncthing-kindle/archive/master.zip)
3. Download [syncthing-linux-arm-vX.XX.X.tar.gz](https://github.com/syncthing/syncthing/releases) and copy `syncthing` binary to `syncthing/bin/`
4. Connect your Kindle to your PC
5. Copy the `syncthing/` folder to `<KINDLE-ROOT>/extensions/syncthing/`, and safely eject
6. Select "Open Firewall for Kindle" from KUAL
7. Select "Start Syncthing INSECURE Admin" from KUAL
8. Find out your Kindle IP address by typing `;711` in search, then open `http://IP-ADDRESS:8080` in your PC's browser.
9. Configure all peers and folders in Syncthing (Syncthing must also be running on your PC/server)
10. Ignore Kindle auto generated index files: `*.sdr`
11. Select "Close INSECURE Admin port" from KUAL (Optional, for security reasons)
12. Select "Stop Syncthing" and then "Start Syncthing" from KUAL
13. Note: Connecting the Kindle to a computer or restarting Kindle will terminate the Syncthing process and firewall.

## Tested on
- Kindle Touch
- Kindle 4

## See also
- [syncthing.koplugin](https://github.com/arthurrump/syncthing.koplugin), a KOReader plugin to use Syncthing from within KOReader
- [kindle-filebrowser](https://github.com/Darthagnon/kindle-filebrowser), used to run a Google-drive-like webserver from your Kindle
- [MailPush](https://github.com/Darthagnon/MailPush), an open replacement for Amazon's **Send to Kindle** email service
- [kindle-kual-blockamazon](https://github.com/Darthagnon/kindle-kual-blockamazon), a set of firewall rules to block Amazon connections to your Kindle. **Essential for older Kindles, e.g. K4 as Amazon will disable the jailbreak as soon as they go online without this firewall.**
