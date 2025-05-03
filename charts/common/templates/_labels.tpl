{{/*Copyright Keiron Dang. All Rights Reserved.*/}}

{{ define "common.labels.standard" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
{{ with .Chart.Version -}}
app.kubernetes.io/version: {{ . | quote }}
{{- end }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}