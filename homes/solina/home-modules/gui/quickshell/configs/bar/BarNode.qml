import Quickshell
import Quickshell.Io
import QtQuick

Item {
   id: barNodeRoot
   height: 34

   property int alignment: Qt.AlignCenter

   anchors.left: alignment === Qt.AlignLeft ? parent.left : undefined
   anchors.horizontalCenter: alignment === Qt.AlignCenter ? parent.horizontalCenter : undefined
   anchors.right: alignment === Qt.AlignRight ? parent.right : undefined

   anchors.bottom: parent.bottom

   width: childrenRect.width + 12

   Rectangle {
      color: "#40ffffff"
        
      anchors.left: alignment === Qt.AlignLeft ? parent.left : undefined
      anchors.centerIn: parent
      anchors.right: alignment === Qt.AlignRight ? parent.right : undefined

      width: contentItem.childrenRect.width + 15
      height: 27
      border.color: "#000000"
      border.width: 2

      Item {
         id: contentItem
         anchors.centerIn: parent
      }
    }

    default property alias content: contentItem.children
}