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

		PanelWindow {
			id: verticalBar
			screen: modelData
			readonly property double scale: screen.height / 1080 / 1.25;

			anchors {
				top: true
				left: true
				bottom: true
			}
			margins {
				top: 6 * scale
				left: 6 * scale
				bottom: 6 * scale
			}

			implicitWidth: 47 * scale
			color: "transparent"

			Rectangle {
				radius: 99999
				anchors.fill: parent
				color: Colors.base

				Item {
					width: parent.width / (verticalBar.scale * 2)
					height: parent.height / (verticalBar.scale * 2)

					transform: Scale {
						xScale: verticalBar.scale * 2
						yScale: verticalBar.scale * 2
					}

					SystemTray {
						Layout.alignment: Qt.AlignHCenter
						parentWindow: verticalBar
						anchors.top: parent.top
						anchors.topMargin: 6
					}

					Workspaces {
						Layout.alignment: Qt.AlignHCenter
						anchors.bottom: parent.bottom
						anchors.bottomMargin: 208
					}

					SystemMonitor {
						anchors.bottom: parent.bottom
						anchors.bottomMargin: 45
						Layout.alignment: Qt.AlignHCenter
					}

					Clock {
						anchors.bottom: parent.bottom
						anchors.bottomMargin: 6
					}
				}
			}
		}
	}
}

