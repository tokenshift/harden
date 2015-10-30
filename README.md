# Harden

Hardening bash scripts for various flavors of linux.

Why bash? Minimal dependencies. These scripts can be used to harden a new VM
without needing to first install Ruby, Ansible, Chef, or whatever else.

Each OS-specific script (in the `templates/` folder) is constructed from
various relevant partials defined under `partials/`.

`build.sh` renders all templates found in the "templates/" folder and places the
results in the "build/" folder (not checked in).

`harden.sh` will attempt to identify the operating system currently in use and
run the appropriate script.
