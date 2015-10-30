answer="NEXT"
while [ ! -z "$answer" ]; do
	echo -n "Add an unprivileged user (leave blank if done): "
	read answer
	if [ ! -z "$answer" ]; then
		echo "Adding user $answer"
		useradd -m "$answer"

		if [ -e ~/.ssh/authorized_keys ]; then
			echo "Copying authorized keys for $answer"
			home_dir=`eval echo "~$answer"`
			mkdir -p "$home_dir/.ssh"
			cp ~/.ssh/authorized_keys "$home_dir/.ssh/"
			chown -R "$answer:$answer" "$home_dir/.ssh/"
		fi
	fi
done