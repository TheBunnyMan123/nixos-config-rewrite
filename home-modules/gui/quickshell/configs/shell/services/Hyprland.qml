pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland

Singleton {
   id: root
   
   readonly property var workspaces: Hyprland.workspaces.values
   readonly property var focusedWorkspace: Hyprland.focusedWorkspace?.id ?? 0
}

