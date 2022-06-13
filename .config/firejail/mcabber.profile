# Firejail profile for mcabber
# This file is overwritten after every install/update
# Persistent local customizations
include /etc/firejail/mcabber.local
# Persistent global definitions
include /etc/firejail/globals.local

noblacklist ${HOME}/.mcabber
noblacklist ${HOME}/.vim
noblacklist ${HOME}/.vimrc

include /etc/firejail/disable-common.inc
include /etc/firejail/disable-devel.inc
include /etc/firejail/disable-interpreters.inc
include /etc/firejail/disable-programs.inc

whitelist ${HOME}/.mcabber
whitelist ${HOME}/.vim
whitelist ${HOME}/.vimrc

caps.drop all
netfilter
nodvd
nonewprivs
noroot
nosound
notv
novideo
#protocol inet,inet6
seccomp
shell none

#private-bin mcabber
private-dev
private-tmp
#private-etc null
