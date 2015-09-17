if [ -z "$SSH_PORT" ]; then
	>&2 echo '$SSH_PORT not set'
	exit 1
fi

echo "Setting SSH port to $SSH_PORT"
sed -i "s/Port [[:digit:]]\+/Port $SSH_PORT/" /etc/ssh/sshd_config