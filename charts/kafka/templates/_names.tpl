{{/*Copyright Keiron Dang. All Rights Reserved.*/}}

{{ define "kafka.broker.name" -}}
{{ printf "%s-broker" (include "common.names.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}