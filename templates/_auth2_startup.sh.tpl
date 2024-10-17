{{- define "auth2.auth2_startup" }}#!/bin/bash
PING_TIMEOUT={{$.Values.auth2.startupProbe.timeoutSeconds | default 0.5 }}
MONITOR_INTERVAL={{- $.Values.auth2.monitoring.interval | default 60 }}
EXPIREDAYS={{- $.Values.auth2.monitoring.expiredays | default 10 }}

{{ $.Files.Get "static/monitor.sh"  }}

if [[ ${status} -eq 0 ]]; then
    #auth2 is ready to use
    sed -i "s/<td id='${SERVICEID}readytime'>.*/<td id='${SERVICEID}readytime'>${now}<\/td>/" ${serverinfofile}
fi

exit ${status}
{{- end }}

