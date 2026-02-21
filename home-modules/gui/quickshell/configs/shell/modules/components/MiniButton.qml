import QtQuick
import qs.config

MouseArea {
   id: root
   signal clickEvent()
   property string text
   property var color
   property real leftPadding
   property real size

   hoverEnabled: true
   width: size
   height: size

   Rectangle {
      anchors.fill: parent
      radius: 99999
      color: root.color

      Text {
         leftPadding: root.leftPadding
         anchors.centerIn: parent
         color: Colors.base
         text: root.text
         font.pixelSize: size
      }
   }

   onClicked: {
      clickEvent()
   }
}
