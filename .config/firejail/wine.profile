# wine profile
noblacklist ${HOME}/misc/wine
noblacklist /tmp/.wine-*

include disable-common.inc
include disable-devel.inc
include disable-interpreters.inc
include disable-passwdmgr.inc
include disable-programs.inc

include whitelist-var-common.inc

machine-id
caps.drop all
netfilter
nodvd
nogroups
nonewprivs
noroot
notv
#seccomp
net none

private-dev
