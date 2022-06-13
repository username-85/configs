#quiet

noblacklist ${HOME}/.netrc

whitelist /tmp/downloads
include /etc/firejail/disable-common.inc
include /etc/firejail/disable-devel.inc
include /etc/firejail/disable-programs.inc

include /etc/firejail/whitelist-var-common.inc

machine-id
caps.drop all
ipc-namespace
netfilter
no3d
nodvd
nogroups
nonewprivs
noroot
nosound
notv
novideo
protocol unix,inet,inet6
seccomp
shell none
tracelog
nogroups

private-dev

noexec ${HOME}
noexec /tmp

blacklist /tmp/.X11-unix
