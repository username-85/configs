# Firejail profile for mutt
# This file is overwritten after every install/update
# Persistent local customizations
include /etc/firejail/mutt.local
# Persistent global definitions
include /etc/firejail/globals.local

blacklist /tmp/.X11-unix

noblacklist ${HOME}/.w3m
noblacklist /var/mail
noblacklist /var/spool/mail
noblacklist ${HOME}/.mutt
noblacklist ${HOME}/data/Mail
noblacklist ${HOME}/.vim
noblacklist ${HOME}/.vimrc

include /etc/firejail/disable-common.inc
include /etc/firejail/disable-devel.inc
include /etc/firejail/disable-interpreters.inc
include /etc/firejail/disable-passwdmgr.inc
include /etc/firejail/disable-programs.inc

whitelist ${HOME}/.w3m
whitelist ${HOME}/.mutt
whitelist ${HOME}/data/Mail
whitelist ${HOME}/.vim
whitelist ${HOME}/.vimrc
whitelist /tmp/mutt/

caps.drop all
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
writable-run-user

private-dev
