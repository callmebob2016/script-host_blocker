# host_blocker
Bash script for blocking / unblocking hosts in /etc/hosts

## Config
Edit script file and add desired domains that should be blocked:
```script
hosts_to_block=("facebook.com" "imdb.com" "instagram.com")
```

## Usage

Run by:
Run script providing path to hosts file as argument:
```script
./host_blocker.sh /etc/hosts
```
