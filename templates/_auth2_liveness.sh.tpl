{{- define "auth2.auth2_liveness" }}#!/bin/bash
PING_TIMEOUT={{$.Values.auth2.livenessProbe.timeoutSeconds | default 0.5 }}
MONITOR_INTERVAL={{- $.Values.auth2.monitoring.interval | default 60 }}
EXPIREDAYS={{- $.Values.auth2.monitoring.expiredays | default 10 }}

{{ $.Files.Get "static/monitor.sh"  }}

exit $status
{{- end }}

