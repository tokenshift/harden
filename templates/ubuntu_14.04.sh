SSH_PORT=54322

`render partials/apt_upgrade_software.sh`

`render partials/apt_upgrade_kernel.sh`

`APT_INSTALL_LIST=iptables render partials/apt_install.sh`
`render partials/iptables_setup.sh`

`render partials/ssh_set_port.sh`
`render partials/ssh_disable_password_auth.sh`

`cat partials/user_add_multiple.sh`

echo "Server requires a restart."