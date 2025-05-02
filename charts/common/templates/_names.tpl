{{/*Copyright Keiron Dang. All Rights Reserved.*/}}

{{ define "common.names.name" -}}
{{ default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{ define "common.names.namespace" -}}
{{ default .Release.Namespace .Values.namespaceOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{ define "common.names.chart" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}