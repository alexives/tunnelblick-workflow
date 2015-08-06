#! /bin/bash

QUERY="$1"
echo "<items>"
connections=$(ls /Library/Application\ Support/Tunnelblick/Users/$USER | sed 's/\.tblk//g')

for connection in $(ls /Library/Application\ Support/Tunnelblick/Users/$USER | grep -i "${QUERY}" | sed 's/\.tblk//g'); do
	echo "<item uuid=\"$(uuidgen)\" arg=\"$connection\" valid=\"YES\">"
	echo "<title>VPN: $connection</title>"
	echo "<subtitle>Open VPN connection - $connection</subtitle>"
	echo "</item>"
done

echo "</items>"