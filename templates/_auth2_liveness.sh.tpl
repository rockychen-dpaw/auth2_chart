{{- define "auth2.auth2_liveness" }}#!/bin/bash
pingTimeout={{$.Values.auth2.livenessProbe.timeoutSeconds | default 0.5 }}
monitorInterval={{- $.Values.auth2.monitor.interval | default 60 }}
maxMonitorServers={{$.Values.auth2.monitor.maxServers | default 50 | int}}
PORT=8080

{{ $.Files.Get "static/monitor.sh"  }}
{{- end }}

