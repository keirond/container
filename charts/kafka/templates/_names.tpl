{{/*Copyright Keiron Dang. All Rights Reserved.*/}}

{{ define "kafka.svc-headless.name" -}}
{{ printf "%s-headless" (include "common.names.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}