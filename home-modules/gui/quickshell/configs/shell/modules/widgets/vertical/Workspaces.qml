import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services

ColumnLayout {
	width: parent.width
	spacing: 2

	Rectangle {
		Layout.alignment: Qt.AlignHCenter

		topLeftRadius: 99
		topRightRadius: 99
		height: 17
		width: 9
		color: (Hyprland.focusedWorkspace == 1) ? Colors.accent: Colors.overlay
	}

	Rectangle {
		Layout.alignment: Qt.AlignHCenter

		height: 17
		width: 9
		color: (Hyprland.focusedWorkspace == 2) ? Colors.accent: Colors.overlay
	}

	Rectangle {
		Layout.alignment: Qt.AlignHCenter

		height: 17
		width: 9
		color: (Hyprland.focusedWorkspace == 3) ? Colors.accent: Colors.overlay
	}

	Rectangle {
		Layout.alignment: Qt.AlignHCenter

		height: 17
		width: 9
		color: (Hyprland.focusedWorkspace == 4) ? Colors.accent: Colors.overlay
	}

	Rectangle {
		Layout.alignment: Qt.AlignHCenter

		bottomLeftRadius: 99
		bottomRightRadius: 99
		height: 17
		width: 9
		color: (Hyprland.focusedWorkspace == 5) ? Colors.accent: Colors.overlay
	}

}

