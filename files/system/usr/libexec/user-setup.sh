#!/usr/bin/env bash

set -euo pipefail
 
while IFS=: read -r username _ uid gid _ homedir shell; do
    [[ "$username" == "root" ]] && continue
    [[ "$shell" == */false ]]   && continue
 
    if [[ "$homedir" == "/var/lib/${username}" ]]; then
        if [[ ! -d "$homedir" ]]; then
            install -d -m 0750 -o "$uid" -g "$gid" "$homedir"
            install -d -m 0750 -o "$uid" -g "$gid" "$homedir/data"
            echo "${username}:100000:65536" >> /etc/subuid
            echo "${username}:100000:65536" >> /etc/subgid
            touch /var/lib/systemd/linger/"$username"

            case "$username" in
            navidrome)
                install -d -m 0750 -o "$uid" -g "$gid" "$homedir/music"
                ;;
            esac
        fi
    fi
done < /etc/passwd