# Firejail profile for qbittorrent
# This file is overwritten after every install/update
# Persistent local customizations
include /etc/firejail/qbittorrent.local
# Persistent global definitions
include /etc/firejail/globals.local

noblacklist ${HOME}/.cache/qBittorrent
noblacklist ${HOME}/.config/qBittorrent
noblacklist ${HOME}/.config/qBittorrentrc
noblacklist ${HOME}/.local/share/data/qBittorrent

# Allow python (blacklisted by disable-interpreters.inc)
noblacklist ${PATH}/python2*
noblacklist ${PATH}/python3*
noblacklist /usr/lib/python2*
noblacklist /usr/lib/python3*

include /etc/firejail/disable-common.inc
include /etc/firejail/disable-devel.inc
include /etc/firejail/disable-passwdmgr.inc
include /etc/firejail/disable-programs.inc

mkdir ${HOME}/.cache/qBittorrent
mkdir ${HOME}/.config/qBittorrent
mkdir ${HOME}/.local/share/data/qBittorrent
whitelist  ${DOWNLOADS}
whitelist /tmp/downloads/
whitelist /home/user/data/tmp/downloads/
whitelist ${HOME}/.cache/qBittorrent
whitelist ${HOME}/.config/qBittorrent
whitelist ${HOME}/.config/qBittorrentrc
whitelist ${HOME}/.local/share/data/qBittorrent
include /etc/firejail/whitelist-common.inc
include /etc/firejail/whitelist-var-common.inc

apparmor
caps.drop all
machine-id
netfilter
nodbus
nodvd
nogroups
nonewprivs
noroot
nosound
notv
novideo
protocol unix,inet,inet6,netlink
seccomp
shell none

private-bin qbittorrent,qbittorrent-nox,python*
private-dev
# private-etc X11,fonts,xdg,resolv.conf
# private-lib - problems on Arch
private-tmp

# memory-deny-write-execute - problems on  Arch, see #1690 on GitHub repo
noexec ${HOME}
noexec /tmp

