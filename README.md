Syncthing for Kindle (KUAL)
================================

## Setup

1. You need a jailbreak and [KUAL](http://www.mobileread.com/forums/showthread.php?t=203326) first.
2. Download [this repository](https://github.com/Darthagnon/syncthing-kindle/archive/master.zip)
3. Download [syncthing-linux-arm-v1.19.2.tar.gz](https://github.com/syncthing/syncthing/releases/tag/v1.19.2) and copy the `syncthing` binary to `syncthing/bin/`
4. Connect your Kindle to your PC
5. Copy the `syncthing/` folder to `<KINDLE-ROOT>/extensions/syncthing/`, and safely eject
6. Goto KUAL >> "Syncthing" 
7. Select "Start Syncthing" from the menu; an IP address such as `192.168.127.1:8384` will appear logged on the screen (you can also find out your Kindle's IP address by typing `;711` in Search)
	- If things aren't working, select "Show Syncthing status" from the menu, which will check if Syncthing is running.
8. Open `http://<IP-ADDRESS>` in your PC's browser; this will give you the Syncthing admin page on your Kindle. The default login username:password is admin:admin
9. Configure all peers and folders in Syncthing on both your Kindle and PC/server (Syncthing must also be running on your PC/server)
10. Ignore any Kindle auto-generated index files; `*.sdr` is pre-configured
11.  If you need to restart Syncthing or are done synchronising, select "Stop Syncthing"
	- Note: Connecting the Kindle to a computer or restarting Kindle will terminate the Syncthing process and firewall.

Syncthing can be started on boot ([gutenye/syncthing-kindle Issue #3](https://github.com/gutenye/syncthing-kindle/issues/3)), but this will likely only work on newer Kindles (not Kindle 4).

## Tests

Devices tested:
- Kindle Touch (v1.0)
- Kindle 4 (v2.x)

If, during testing (e.g. via Kindle USBNetwork SSH), you run syncthing without config path arguments, it will generate default config in `/tmp/root/.config/`; this can be removed for cleanup purposes by `rm -rf /tmp/root/.config`

Run tests via Kindle USBNetwork SSH: 
```
mntroot rw
cd /mnt/us/extensions/syncthing
# sh bin/syncthing_wrapper.sh
bin/syncthing -home=/mnt/us/extensions/syncthing/config -gui-address '0.0.0.0:80' -no-upgrade -no-restart
```
To SSH tunnel on PC: `ssh -L 8421:127.0.0.1:80 root@192.168.15.244`, login (user `root`, no password) then you can access the Kindle's Syncthing WebUI from http://localhost:8421

Syncthing versions tested:

- [Syncthing v1.19.2](https://github.com/syncthing/syncthing/releases/tag/v1.19.2) is the last version that works on Kindle, due to GoLang versions since v1.17.7 no longer having fallback from `accept4()` to `accept()` on Linux ARM builds ([Syncthing Issue #8325](https://github.com/syncthing/syncthing/issues/8325))
- [Syncthing v1.0.1](https://github.com/syncthing/syncthing/releases/tag/v1.0.1) (does not work well, and very slow; after a while it logs usage instructions; [final version that runs on WinXP hosts](https://forum.syncthing.net/t/syncthing-in-windows-xp/15246/2), so it uses old TLS and is a bit ancient)
- [Syncthing v1.20.4](https://github.com/syncthing/syncthing/releases/tag/v1.20.4) (2 Aug 2022, v1.0 of this plugin was released 4 Aug 2022; does not work due to GoLang v1.18)
- [Syncthing v1.23.2](https://github.com/syncthing/syncthing/releases/tag/v1.23.2) (it is suggested that `accept4()` fallback to `accept()` was reintroduced around this version; does not work due to `epoll` errors) 
- [Syncthing v1.27.0](https://github.com/syncthing/syncthing/releases/tag/v1.27.0) (does not work; [final version that runs on Win7 hosts](https://forum.syncthing.net/t/syncthing-crashing-after-updating-to-v1-27-1-windows-7-runtime-asmstdcall/21248))
- [Syncthing v1.30.0](https://github.com/syncthing/syncthing/releases/tag/v1.30.0) (does not work; final release of Syncthing v1.xx.x)

## See also
- [syncthing.koplugin](https://github.com/arthurrump/syncthing.koplugin), a KOReader plugin to use Syncthing from within KOReader
- [kindle-filebrowser](https://github.com/Darthagnon/kindle-filebrowser), used to run a Google-drive-like webserver from your Kindle
- [MailPush](https://github.com/Darthagnon/MailPush), an open replacement for Amazon's **Send to Kindle** email service
- [kindle-kual-blockamazon](https://github.com/Darthagnon/kindle-kual-blockamazon), a set of firewall rules to block Amazon connections to your Kindle. **Essential for older Kindles, e.g. K4 as Amazon will disable the jailbreak as soon as they go online without this firewall.**
