{{/*Copyright Keiron Dang. All Rights Reserved.*/ -}}

{{- define "kafka.broker.name" }}
    {{- printf "%s-broker" (include "common.names.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "kafka.controller.name" }}
    {{- printf "%s-controller" (include "common.names.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}