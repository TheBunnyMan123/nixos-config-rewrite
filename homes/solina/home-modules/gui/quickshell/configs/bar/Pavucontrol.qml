pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Singleton {
   id: root
   
   property bool running: false

   Process {
      id: pavucontrolProcess
      command: ["pavucontrol"]
      running: root.running

      // onFinished: {
      //    root.running = false
      // }
   }
}
