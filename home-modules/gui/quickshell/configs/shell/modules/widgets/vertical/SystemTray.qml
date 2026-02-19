import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import qs.config
import qs.services

Item {
	anchors.top: parent.top

	required property var parentWindow

	property var items: ({})

	ColumnLayout {
		anchors.top: parent.top
		width: parent.width
		spacing: 5
		id: tray

		Repeater {
			model: SystemTray.items

			Image {
				required property var modelData
				source: modelData && modelData.icon ? modelData.icon.toString() : ""
				fillMode: Image.PreserveAspectFit
				smooth: true
				Layout.alignment: Qt.AlignHCenter
				Layout.preferredWidth: 24
				Layout.preferredHeight: 15


				MouseArea {
					anchors.fill: parent
					acceptedButtons: Qt.LeftButton | Qt.RightButton
					onClicked: mouse => {
						if (mouse.button === Qt.LeftButton && !parent.modelData.onlyMenu) {
							parent.modelData.activate()
						} else if (parent.modelData.hasMenu) {
							parent.modelData.display(parentWindow, 0, 0)
						}
					}
				}
			}
		}
	}
}

