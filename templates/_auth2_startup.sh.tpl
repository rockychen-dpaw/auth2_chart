{{- define "auth2.auth2_startup" }}#!/bin/bash
pingTimeout={{$.Values.auth2.startupProbe.timeoutSeconds | default 0.5 }}
monitorInterval={{- $.Values.auth2.monitor.interval | default 60 }}
maxMonitorServers={{$.Values.auth2.monitor.maxServers | default 50 | int}}
PORT=8080

{{ $.Files.Get "static/monitor.sh"  }}

if [[ $status -eq 0 ]]; then
    #auth2 is ready to use
    sed -i "0,/<td id='${HOSTNAME}readytime'><\/td>/s//<td id='${HOSTNAME}readytime'>$(date '+%Y-%m-%d %H:%M:%S')<\/td>/" ${serverinfofile}
fi

exit $status
{{- end }}

