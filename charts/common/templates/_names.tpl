{{/*Copyright Keiron Dang. All Rights Reserved.*/}}

{{ define "common.names.fullname" -}}
{{ default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}
