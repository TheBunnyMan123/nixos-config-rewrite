pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
   id: root
   
   readonly property string time: {
      Qt.formatDateTime(clock.date, "hh\nmm\nAP")
   }

   SystemClock {
      id: clock
      precision: SystemClock.Minutes
   }
}
