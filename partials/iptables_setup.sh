echo "iptables: Accept any traffic on established connections"
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

echo "iptables: Accepting all loopback traffic"
iptables -A INPUT -i lo -j ACCEPT

echo "iptables: Opening port 22 for SSH"
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

echo -n "iptables: Open port 80 (HTTP)? [Y/n] "
read answer
if [ ${answer,,} = "y" ]; then
	echo "iptables: Opening port 80"
	iptables -A INPUT -p tcp --dport 80 -j ACCEPT
fi

echo -n "iptables: Open port 443 (HTTPS)? [Y/n] "
read answer
if [ ${answer,,} = "y" ]; then
	echo "iptables: Opening port 443"
	iptables -A INPUT -p tcp --dport 443 -j ACCEPT
fi

answer="NEXT"
while [ ! -z "$answer" ]; do
	echo -n "iptables: Open another port (leave blank if done): "
	read answer
	if [ ! -z "$answer" ]; then
		echo "iptables: Opening port $answer"
		iptables -A INPUT -p tcp --dport $answer -j ACCEPT
	fi
done	

echo "iptables: Logging any rejected traffic"
iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

echo "iptables: Rejecting any other traffic"
iptables -A INPUT -j DROP

echo "iptables: Persisting rules"
iptables-save > /etc/iptables.rules
cat > /etc/network/if-pre-up.d/iptablesload <<EOM
#!/bin/sh
iptables-restore < /etc/iptables.rules
exit 0
EOM
chmod +x /etc/network/if-pre-up.d/iptablesload