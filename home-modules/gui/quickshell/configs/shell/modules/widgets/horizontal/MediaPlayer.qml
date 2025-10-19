import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import qs.config
import qs.modules.components

RowLayout {
   id: root
   property string playPauseText: "\udb81\udc0a"
   property real playPauseLeftPadding: 1.8

   anchors.verticalCenter: parent.verticalCenter
   anchors.right: parent.right
   property var playerList: Mpris.players.values

   property var player

   ComboBox {
      id: selection
      model: playerList
      textRole: "identity"

      Layout.alignment: Qt.AlignVCenter

      popup.popupType: Popup.Window
      popup.height: Math.max(Math.min(playerList.length * 30, 200), 10)
      popup.background: Rectangle {
         color: Colors.overlay
         radius: 10
      }

      onCurrentIndexChanged: {
         player = playerList[currentIndex]
      }

      background: Rectangle {
           color: Colors.overlay
           radius: 10
      }

      contentItem: Text {
         text: (selection.displayText == "") ? "" : selection.displayText + "  "
         color: Colors.text
         verticalAlignment: Text.AlignVCenter
         anchors.left: parent.left
         anchors.margins: 6
         leftPadding: 1
         rightPadding:  (selection.displayText == "") ? 4 : 3
         font.pixelSize: 13
      }

      indicator: Canvas {
         id: canvas
         x: selection.width - width - 10
         y: selection.topPadding + (selection.availableHeight - height) / 2
         width: 16
         height: 8

         anchors.right: parent.right
         anchors.margins: 6
        
         onPaint: {
            let ctx = getContext("2d")
            ctx.reset()
            ctx.fillStyle = Colors.text
            ctx.moveTo(4 + 3, 1)
            ctx.lineTo(width - 4 + 3, 1)
            ctx.lineTo(width / 2 + 3, height - 1)
            ctx.closePath()
            ctx.fill()
         }
      }

      delegate: ItemDelegate {
         width: selection.width
         contentItem: Text {
            text: modelData.identity
            font.pixelSize: 13
            color: Colors.text
         }

         background: Rectangle {
            color: highlighted ? Colors.accent : Colors.overlay
            radius: 10
         }
      }
   }

   Item {
      width: 5
   }

   MiniButton {
      text: "\udb81\udcae"
      color: (!player || !player.canGoPrevious) ? Colors.buttonDisabled : parent.containsMouse ? (parent.pressed ? Colors.buttonClicked : Colors.buttonHovered) : Colors.buttonDefault
      leftPadding: -0.983
      onClicked: {
         if (player && player.canGoPrevious) {
            player.previous()
         }
      }
   }

   MiniButton {
      text: root.playPauseText
      color: (!player || !player.canTogglePlaying) ? Colors.buttonDisabled : parent.containsMouse ? (parent.pressed ? Colors.buttonClicked : Colors.buttonHovered) : Colors.buttonDefault
      leftPadding: root.playPauseLeftPadding
      onClicked: {
         if (player && player.canTogglePlaying) {
            player.togglePlaying()
         }
      }
   }

   MiniButton {
      text: "\udb81\udcad"
      leftPadding: -0.983
      color: (!player || !player.canGoNext) ? Colors.buttonDisabled : parent.containsMouse ? (parent.pressed ? Colors.buttonClicked : Colors.buttonHovered) : Colors.buttonDefault
      onClicked: {
         if (player && player.canGoNext) {
            player.next()
         }
      }
   }

   FrameAnimation {
      running: true
      onTriggered: {
         if (player) {
            if (player.isPlaying) {
               playPauseText = "\udb80\udfe4"
               playPauseLeftPadding = -0.8
            } else {
               playPauseText = "\udb81\udc0a"
               playPauseLeftPadding = 1.8
            }
         }
      }
   }
}
