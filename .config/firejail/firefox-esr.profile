# Firejail profile for firefox-esr
# This file is overwritten after every install/update
# Persistent local customizations
include firefox-esr.local
# Persistent global definitions
# added by included profile
#include globals.local

whitelist /usr/share/firefox-esr

# Redirect
include firefox.profile

#nosound
whitelist /tmp/downloads/

#for native notification
dbus-user.talk org.freedesktop.Notifications
