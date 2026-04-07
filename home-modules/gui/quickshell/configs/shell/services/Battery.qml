pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
   id: root
   
   readonly property real percent: UPower.devices.values[0].percentage
}
