{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels used by all resources in their meta fields.
Includes existing labels for passivity, new standard labels, and user-defined extra labels.
https://helm.sh/docs/chart_best_practices/labels/
https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels
*/}}
{{- define "athens.metaLabels" -}}
{{- /* Allow an app suffix name to be passed in to append to the fullname */}}
{{- $defaultAppName := include "fullname" . }}
{{- $appName := printf "%s%s" $defaultAppName (default "" .appSuffix) }}
{{- /* Existing Legacy labels for passivity */}}
app: {{ $appName }}
chart: {{ template "athens.chart" . }}
release: "{{ .Release.Name }}"
heritage: "{{ .Release.Service }}"
{{- /* New Standard labels */}}
app.kubernetes.io/name: {{ $appName }}
helm.sh/chart: {{ template "athens.chart" . }}
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
app.kubernetes.io/instance: "{{ .Release.Name }}"
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- /* Include user defined labels */}}
{{- if .Values.extraLabels }}
{{ toYaml .Values.extraLabels }}
{{- end -}}
{{- end }}

{{/*
A common helper for creating the full chart name and version as used by the chart label.
*/}}
{{- define "athens.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Determine the home directory of the current user.
*/}}
{{- define "home" -}}
{{- if not .Values.image.runAsNonRoot -}}
/root
{{- else -}}
/home/athens
{{- end -}}
{{- end -}}
