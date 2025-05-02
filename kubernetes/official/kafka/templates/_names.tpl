{{/*
Copyright Keiron Dang. All Rights Reserved.
*/}}

{{ define "kafka.broker.name" -}}
{{ default .Chart.Name .Values.nameOverride }}
{{- end }}