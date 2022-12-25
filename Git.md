### Useful aliases

```bash
// Git all
git config --global alias.all '!f() { ls -R -d */.git | xargs -I{} bash -c "echo {} && git -C {}/../ $1"; }; f'

// Git a dog
git config --global alias.adog "log --all --decorate --oneline --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"

```

### Pull submodules after clone
```
git submodule update --init
```
