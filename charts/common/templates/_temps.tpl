{{/*Copyright Keiron Dang. All Rights Reserved.*/}}

{{/*---------------------------------------------*/}}

{{- define "common.names.name" }}
    {{- default .Chart.Name .Values.override.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "common.names.namespace" }}
    {{- default .Release.Namespace .Values.override.namespace | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "common.names.chart" }}
    {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*---------------------------------------------*/}}

{{- define "common.labels.standard" }}
    {{- printf "helm.sh/chart: %s\n" (include "common.names.chart" .) }}
    {{- printf "app.kubernets.io/name: %s\n" (include "common.names.name" .) }}
    {{- with .Chart.AppVersion }}
        {{- printf "app.kubernetes.io/version: %s\n" . }}
    {{- end }}
    {{- printf "app.kubernetes.io/instance: %s\n" .Release.Name }}
    {{- printf "app.kubernetes.io/managed-by: %s" .Release.Service }}
{{- end }}

{{- define "common.labels.custom" }}
    {{- if and (hasKey . "labels") (hasKey . "context") }}
        {{- template "common.utils.render" (dict "value" .labels "context" .context) }}
        {{- print "\n" (include "common.labels.standard" .context) }}
    {{- else }}
        {{- include "common.labels.standard" . }}
    {{- end }}
{{- end }}

{{/*---------------------------------------------*/}}

{{- define "common.annotations.custom" }}
    {{- template "common.utils.render" (dict "value" .annotations "context" .context) }}
{{- end }}

{{/*---------------------------------------------*/}}

{{- define "common.utils.render" }}
    {{- $value := typeIs "string" .value | ternary .value (.value | toYaml) }}
    {{- if contains "{{" (toJson .value) }}
        {{- tpl $value .context }}
    {{- else }}
        {{- $value }}
    {{- end }}
{{- end }}