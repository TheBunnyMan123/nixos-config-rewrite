import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

ColumnLayout {
   spacing: 10

   Rectangle {
      id: storage
      Layout.alignment: Qt.AlignHCenter
      radius: 10
      height: 150
      width: 20
      color: Colors.overlay
      clip: true

      Text {
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottomMargin: 2
         text: `\uf0a0`
         font.pixelSize: 15
         color: Colors.text
      }

      Rectangle {
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottomMargin: 22
         color: Colors.text
         width: parent.width
         height: 2
      }

      Rectangle {
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottomMargin: 24
         color: Colors.darkAccent
         width: parent.width
         topLeftRadius: 10
         topRightRadius: 10
         height: SystemUsage.storageUsagePercent * 126

         Text {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: (width - height) / 2 + 2
            font.pixelSize: 15
            rotation: -90
            text: SystemUsage.storageUsage;
            color: Colors.text
         }
      }
   }

   Rectangle {
      id: mem
      Layout.alignment: Qt.AlignHCenter
      radius: 10
      height: 150
      width: 20
      color: Colors.overlay
      clip: true

      Text {
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottomMargin: 2
         text: `\uefc5`
         font.pixelSize: 15
         color: Colors.text
      }

      Rectangle {
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottomMargin: 22
         color: Colors.text
         width: parent.width
         height: 2
      }

      Rectangle {
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottomMargin: 24
         color: Colors.darkAccent
         width: parent.width
         topLeftRadius: 10
         topRightRadius: 10
         height: SystemUsage.memoryUsagePercent * 126

         Text {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: (width - height) / 2 + 2
            font.pixelSize: 15
            rotation: -90
            text: SystemUsage.memoryUsage;
            color: Colors.text
         }
      }
   }

   Rectangle {
      id: cpu
      Layout.alignment: Qt.AlignHCenter
      radius: 10
      height: 150
      width: 20
      color: Colors.overlay
      clip: true

      Text {
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottomMargin: 2
         text: `\uf4bc`
         font.pixelSize: 15
         leftPadding: -0.2
         color: Colors.text
      }

      Rectangle {
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottomMargin: 22
         color: Colors.text
         width: parent.width
         height: 2
      }

      Rectangle {
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottomMargin: 24
         color: Colors.darkAccent
         width: parent.width
         topLeftRadius: 10
         topRightRadius: 10
         height: SystemUsage.cpuPerformance * 126

         Text {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: (width - height) / 2 + 2
            font.pixelSize: 15
            rotation: -90
            text: `${Math.round(SystemUsage.cpuPerformance * 100)}%`;
            color: Colors.text
         }
      }
   }
}
