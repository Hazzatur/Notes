[Guide](https://linuxconfig.org/ubuntu-20-04-minecraft-server-setup)

```
function minecraft() {
    sudo su -c 'screen -r mc-$1' minecraft
}
```

```
alias mcPerms="sudo chown -R minecraft:minecraft /opt/minecraft/*"
```
