{{/*Copyright Keiron Dang. All Rights Reserved.*/}}

{{ define "kafka.svc-headless.name" -}}
{{ default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}