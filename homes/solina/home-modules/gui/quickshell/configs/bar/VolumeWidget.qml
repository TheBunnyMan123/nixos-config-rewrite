import Quickshell
import Quickshell.Io
import QtQuick

BarNode {
   required property int align
   alignment: align

   Text {
      id: volume
      font.pixelSize: 15
      font.family: "sans-serif"
      text: "\udb81\udd7e  " + Audio.volume + "%"
      anchors.centerIn: parent
   }

   MouseArea {
      anchors.fill: volume

      onClicked: {
         Pavucontrol.running = false
         Pavucontrol.running = true
      }

      hoverEnabled: true
      cursorShape: Qt.PointingHandCursor
   }
}
