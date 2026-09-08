#!/bin/sh
chown pgadmin:root /var/lib/pgadmin

storage_path=/var/lib/pgadmin/storage/$(echo $PGADMIN_DEFAULT_EMAIL | sed 's/@/_/g')
sudo -u pgadmin mkdir -p -m 00775 $storage_path

install -o pgadmin -g root -m 00755 /etc/secrets/servers.json /var/lib/pgadmin/storage/

install -o pgadmin -g root -m 0600 /etc/secrets/pgpassfile $storage_path

sudo -Eu pgadmin /entrypoint.sh
