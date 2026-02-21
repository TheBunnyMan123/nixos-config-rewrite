pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

Singleton {
	id: root

	readonly property HyprlandToplevel focusedWindow: {
		Hyprland.refreshToplevels()
		return Hyprland.activeToplevel
	}
	readonly property var workspaces: Hyprland.workspaces.values
	readonly property int focusedWorkspace: Hyprland.focusedWorkspace?.id ?? 0
}

