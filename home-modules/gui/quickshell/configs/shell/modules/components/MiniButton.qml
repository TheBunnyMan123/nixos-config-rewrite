import QtQuick
import qs.config

MouseArea {
   id: root
   signal clickEvent()
   property string text
   property var color
   property real leftPadding

   hoverEnabled: true
   width: 20
   height: 20

   Rectangle {
      anchors.fill: parent
      radius: 10
      color: root.color

      Text {
         leftPadding: root.leftPadding
         anchors.centerIn: parent
         color: Colors.base
         text: root.text
         font.pixelSize: 20
      }
   }

   onClicked: {
      clickEvent()
   }
}
