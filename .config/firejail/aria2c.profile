include /etc/firejail/disable-common.inc
include /etc/firejail/disable-devel.inc
include /etc/firejail/disable-programs.inc

noblacklist ${HOME}/.aria2
mkdir ${HOME}/.aria2
whitelist ${HOME}/.aria2
whitelist /tmp/downloads/
whitelist /home/user/data/tmp/downloads/

caps.drop all
machine-id
netfilter
nodvd
nonewprivs
noroot
nosound
notv
novideo
protocol unix,inet,inet6,netlink
seccomp
no3d
nogroups

private-bin aria2c
private-dev
private-tmp

blacklist /tmp/.X11-unix
