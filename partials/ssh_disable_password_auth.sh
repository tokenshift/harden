echo "Disabling password authentication"
sed -i 's/#\?[:space:]*PasswordAuthentication \(yes\|no\)/PasswordAuthentication no/' /etc/ssh/sshd_config