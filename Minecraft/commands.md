```
function minecraft() {
    sudo su -c 'screen -r mc-$1' minecraft
}
```

```
alias mcPerms="sudo chown -R minecraft:minecraft /opt/minecraft/*"
```
