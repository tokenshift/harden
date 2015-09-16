# Harden

Hardening bash scripts for various flavors of linux.

Why bash? Minimal dependencies. These scripts can be used to harden a new VM
without needing to first install Ruby, Ansible, Chef, or whatever else.

All of the OS-specific scripts are M4 templates, which pull in various relevant
partials defined in the "partials" folder. There's also a "checksums" folder,
which contains checksum files (MD5, SHA256, whatever is provided by the host)
for files downloaded by the hardening scripts.

There the "harden.sh" script in the root will attempt to identify the operating
system currently in use and run the appropriate script.