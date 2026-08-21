import QtQuick

BarNode {
   required property int align
   alignment: align

   Text {
      id: clock
      font.pixelSize: 15
      font.family: "sans-serif"
      text: "\ue641  " + Time.time
      anchors.centerIn: parent
   }
}
