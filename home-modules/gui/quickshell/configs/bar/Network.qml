pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
   id: root
   property string name: ""
   property string speed: ""

   Process {
      id: nameProcess
      running: true
      command: ["sh", "-c", `iwconfig 2>/dev/null | sed -n 's/.*SSID:"\\(.*\\)"/\\1/p'`]
      stdout: StdioCollector {
         onStreamFinished: root.name = this.text
      }
   }

   Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: nameProcess.running = true
   }
}
