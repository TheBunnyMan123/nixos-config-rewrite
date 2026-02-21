pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
	id: root

	readonly property var notifications: server.trackedNotifications.values

	NotificationServer {
		id: server
		keepOnReload: true
		imageSupported: true
		actionsSupported: true

		onNotification: notif => {
			notif.tracked = true
		}
	}
}

