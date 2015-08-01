#! /bin/bash

QUERY="$1"
echo "<items>"
connections=$(ls /Library/Application\ Support/Tunnelblick/Users/$USER | sed 's/\.tblk//g')

for connection in $connections; do
	if [[ -z "${QUERY}" ]] || [[ "${connection}" = "${QUERY}"* ]]; then
		echo "<item uuid=\"$(uuidgen)\" arg=\"$connection\" valid=\"YES\">"
		echo "<title>VPN: $connection</title>"
		echo "<subtitle>Open VPN connection - $connection</subtitle>"; 
		echo "</item>"
	fi
done

echo "</items>"