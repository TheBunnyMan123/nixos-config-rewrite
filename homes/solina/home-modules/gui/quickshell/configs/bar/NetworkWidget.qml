import QtQuick

BarNode {
   required property int align
   alignment: align

   Text {
      id: network
      font.pixelSize: 15
      font.family: "sans-serif"
      text: `\uf1eb   ${Network.name}`
      anchors.centerIn: parent
   }
}
