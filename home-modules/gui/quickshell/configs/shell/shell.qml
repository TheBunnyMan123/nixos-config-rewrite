//@ pragma UseQApplication

import QtQuick
import Quickshell
import "./modules/border"

ShellRoot {
   id: root

   Loader {
      active: true
      sourceComponent: Border {}
   }
}
