#!/usr/bin/env python
#
# gnome-session resets the keyboard layout every time the session is active.
# xmodmap seems to be marked as obsolete, BUT there is no decent way to tweak
# little keys from an existent layout.
# This script monitors an unlocked session and keyboard indicator events and
# calls xmodmap after a small delay.
#
# Author: Romano Augusto
# License: MIT

import os, dbus, gobject, time
from dbus.mainloop.glib import DBusGMainLoop

def xmodmap(criteria):
    def run(*args):
        if criteria(*args):
            time.sleep(1)
            os.system("xmodmap ~/.Xmodmap")

    return run

def by_session(*args):
    return len(args) >= 2 and "SessionIsActive" in args[1] and \
        args[1]["SessionIsActive"] == True

def by_indicator(*args):
    return True

dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)

bus = dbus.SessionBus()
bus.add_signal_receiver(xmodmap(by_session),
        dbus_interface="org.freedesktop.DBus.Properties",
        path="/org/gnome/SessionManager")
bus.add_signal_receiver(xmodmap(by_indicator),
        dbus_interface="org.gtk.Actions",
        path="/com/canonical/indicator/keyboard")

loop = gobject.MainLoop()
loop.run()
