pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Singleton {
   id: root
   
   readonly property int volume: {
      Math.round(Pipewire.defaultAudioSink.audio.volume * 100)
   }

   PwObjectTracker  {
      objectName: "audio"
      objects: [
         Pipewire.defaultAudioSink
      ]
   }
}
