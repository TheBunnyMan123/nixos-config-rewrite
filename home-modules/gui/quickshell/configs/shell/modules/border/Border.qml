import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config
import qs.services
import qs.modules.widgets.horizontal
import qs.modules.widgets.vertical

Variants { 
   model: Quickshell.screens 

   Scope {
      required property var modelData

      Item {
         PanelWindow {
            id: verticalBar
            screen: modelData

            anchors {
               top: true
               left: true
               bottom: true
            }

            implicitWidth: 37
            color: Colors.base

            SystemTray {
               Layout.alignment: Qt.AlignHCenter
               parentWindow: verticalBar
            }

            ColumnLayout {
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.bottom: parent.bottom

               width: parent.width

               SystemMonitor {
                  Layout.alignment: Qt.AlignHCenter
               }

               Item { width: 20 }
            }
         }

         PanelWindow {
            screen: modelData

            anchors {
               left: true
               bottom: true
               right: true
            }

            RowLayout {
               spacing: 10
               anchors.fill: parent

               Item {}

               Clock {
                  Layout.alignment: Qt.AlignVCenter
               }
            }

            MediaPlayer {}

            implicitHeight: 27
            color: Colors.base
         }

         PanelWindow {
            screen: modelData

            anchors {
               top: true
               left: true
               right: true
            }

            implicitHeight: 15
            color: Colors.base
         }

         PanelWindow {
            screen: modelData

            anchors {
               top: true
               bottom: true
               right: true
            }

            implicitWidth: 15
            color: Colors.base
         }
      }
   }
}

