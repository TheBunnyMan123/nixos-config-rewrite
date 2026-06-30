import Quickshell
import Quickshell.Io
import QtQuick

Scope {
   id: root
   
   Variants {
      model: Quickshell.screens;

      PanelWindow {
         required property var modelData
         screen: modelData

         anchors {
            top: true
            left: true
            right: true
         }

         implicitHeight: 38
         color: "transparent"

         VolumeWidget {
            align: Qt.AlignLeft
         }
         
         ClockWidget {
            align: Qt.AlignCenter
         }

         NetworkWidget {
            align: Qt.AlignRight
         }
      }
   }
}
