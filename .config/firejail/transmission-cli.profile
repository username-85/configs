include globals.local
include disable-common.inc
include disable-devel.inc
include disable-interpreters.inc
include disable-programs.inc

noblacklist ${HOME}/.cache/transmission
noblacklist ${HOME}/.config/transmission
whitelist  ${DOWNLOADS}
whitelist /tmp/downloads/
whitelist /home/user/tmp/downloads/

caps.drop all
machine-id
netfilter
nodvd
nonewprivs
noroot
nosound
notv
nou2f
novideo
protocol unix,inet,inet6
seccomp
shell none
tracelog

# private-bin transmission-cli
private-dev
private-etc ca-certificates,ssl,pki,crypto-policies,resolv.conf
private-tmp

memory-deny-write-execute
