pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
   id: root

   property real cpuPerformance
   property string memoryUsage
   property real memoryUsagePercent
   property string storageUsage
   property real storageUsagePercent

   function formatKiB(kib: real): string {
      const mib = 1024
      const gib = mib ** 2
      const tib = 1024 ** 3

      if (kib >= tib) {
         return `${Math.round(kib / tib)} TiB`
      } else if (kib >= gib) {
         return `${Math.round(kib / gib)} GiB`
      } else if (kib >= mib) {
         return `${Math.round(kib / mib)} MiB`
      } else {
         return `${Math.round(kib)} KiB`
      }
   }

   FileView {
      property real lastCpuTotal: 0
      property real lastCpuIdle: 0

      id: stat
      path: "/proc/stat";
      onLoaded: {
         const data = text().match(/cpu\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/);

         if (data) {
            const stats = data.slice(1).map(num => parseInt(num, 10))
            const total = stats.reduce((a, b) => a + b, 0)
            const idle = stats[3] + (stats[4] ?? 0);

            const totalDiff = total - stat.lastCpuTotal;
            const idleDiff = idle - stat.lastCpuIdle;
            root.cpuPerformance = totalDiff > 0 ? (1 - idleDiff / totalDiff) : 0;

            stat.lastCpuTotal = total;
            stat.lastCpuIdle = idle;
         }
      }
   }

   FileView {
      id: mem
      path: "/proc/meminfo";
      onLoaded: {
         const data = text();
         const total = parseInt(data.match(/MemTotal:\s+(\d+)/).splice(1), 10)
         const available = parseInt(data.match(/MemAvailable:\s+(\d+)/).splice(1), 10)

         if (total && available) {
            const used = total - available;

            root.memoryUsage = formatKiB(used);
            root.memoryUsagePercent = used / total;
         }
      }
   }

   Process {
      id: storage
      command: ["sh", "-c", "df -h / | awk '{print $3, $5}'"]
      
      stdout: StdioCollector {
         onStreamFinished: {
            const used = text.match(/(\d+)([^%])/)

            root.storageUsage = `${used[1]} ${used[2]}iB`
            root.storageUsagePercent = parseInt(text.match(/(\d+)%/).splice(1), 10) / 100
         }
      }
   }

   Timer {
      interval: 3000
      running: true
      repeat: true
      triggeredOnStart: true

      onTriggered: {
         stat.reload()
         mem.reload()

         storage.running = true
      }
   }
}
