# Harden

Hardening bash scripts for various flavors of linux.

Why bash? Minimal dependencies. These scripts can be used to harden a new VM
without needing to first install Ruby, Ansible, Chef, or whatever else.

All of the OS-specific scripts are M4 templates, which pull in various relevant
partials defined in the "partials" folder.

`build.sh` renders all templates found in the "templates/" folder and places the
results in the "build/" folder (not checked in).

`harden.sh` will attempt to identify the operating system currently in use and
run the appropriate script.