import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import qs.config
import qs.modules.components

Text {
   property var chargingIcons: ["\udb82\udc9f", "\udb84\udea4", "\udb84\udea5", "\udb84\udea6"]
   property var icons: ["\udb80\udc8e", "\udb84\udea1", "\udb84\udea2", "\udb84\udea3"]

   property var batteryList: UPower.devices.values
   property var battery: batteryList[0]
   property var charging: !UPower.onBattery
   property int level: Math.round(battery.percentage * 3)
   property var icon: charging && chargingIcons[level] || icons[level]

   font.family: "sans-serif"
   color: Colors.text
   text: (battery && battery.isLaptopBattery && `${icon}  ${Math.floor(battery.percentage * 100)}%`) || ""
}

