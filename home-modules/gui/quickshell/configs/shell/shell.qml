//@ pragma UseQApplication

import QtQuick
import Quickshell
import "./modules/win"

ShellRoot {
   id: root

   Loader {
      active: true
      sourceComponent: Win {}
   }
}
