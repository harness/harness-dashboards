{{/*
Expand the name of the chart.
*/}}
{{- define "harness-dashboards.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "harness-dashboards.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "harness-dashboards.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "harness-dashboards.labels" -}}
helm.sh/chart: {{ include "harness-dashboards.chart" . }}
{{ include "harness-dashboards.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "harness-dashboards.selectorLabels" -}}
app.kubernetes.io/name: {{ include "harness-dashboards.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "harness-dashboards.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "harness-dashboards.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{- define "harnesscommon.generateGrafanaDashboardsCR" -}}
{{- $ := .ctx }}
{{- range $path, $_ := $.Files.Glob  .dashboardDirectoryPath }}
{{- $ext := ext $path}}
apiVersion: grafana.integreatly.org/v1beta1
kind: GrafanaDashboard
metadata:
  name: {{ regexReplaceAll "\\W+" ($path | trunc -63 | replace $ext "") "_" | replace "_" "-" | trimPrefix "-" | lower }}
  namespace: '{{ $.Release.Namespace }}'
spec:
  resyncPeriod: '{{ default "30s" $.Values.resyncPeriod }}'
  instanceSelector:
    matchLabels:
    {{- if $.Values.matchLabels }}
    {{- include "harnesscommon.tplvalues.render" ( dict "value" $.Values.matchLabels "context" $ ) | nindent 6 }}
    {{- end }}
  folderRef: '{{ regexReplaceAll "\\W+" (dir $path | trunc -63) "_" | replace "_" "-" |  trimPrefix "-" | lower }}'
  json: |-
  {{- $.Files.Get $path | fromJson | toPrettyJson | nindent 4}}
---
{{- end }}
{{- end }}

{{- define "harnesscommon.generateGrafanaFoldersCR" -}}
{{- $ := .ctx }}
{{- $pathDirs := list }}
{{- range $match, $_ := $.Files.Glob .dashboardDirectoryPath }}
    {{- $pathDirs = append $pathDirs ($match | dir) }}
{{- end }}
{{- $pathDirs = $pathDirs | uniq }}
{{- $dirs := list }}
{{- range $_, $pathDir := $pathDirs }}
    {{- $dir := "" }}
    {{- range $idx , $ctx := $pathDir | splitList "/" }}
        {{- $dir = printf "%s%s" $dir $ctx }}
        {{- $dirs = append $dirs $dir }}
        {{- $dir = printf "%s%s" $dir "/" }}
    {{- end }}
{{- end }}
{{- $dirs = $dirs | uniq }}
{{- range $folderName:= $dirs }}
    {{- $parentFolder := regexReplaceAll "\\W+" (dir $folderName | trunc -63) "_" | replace "_" "-" | trimPrefix "-" | lower}}
    {{- $currentFolder := regexReplaceAll "\\W+" ($folderName | trunc -63) "_" | replace "_" "-" | trimPrefix "-" | lower }}
    {{- $rootFolderName := regexReplaceAll "\\W+" (base $folderName | trunc -63) "_" | replace "_" "-" | trimPrefix "-" }}
---
apiVersion: grafana.integreatly.org/v1beta1
kind: GrafanaFolder
metadata:
  name: {{ $currentFolder }}
  namespace: '{{ $.Release.Namespace }}'
spec:
  instanceSelector:
    matchLabels:
    {{- if $.Values.matchLabels }}
    {{- include "harnesscommon.tplvalues.render" ( dict "value" $.Values.matchLabels "context" $ ) | nindent 6 }}
    {{- end }}
  {{- if ne $parentFolder "." }}
  parentFolderRef: '{{ $parentFolder }}'
  {{- end }}
  resyncPeriod: '{{ default "30s" $.Values.resyncPeriod }}'
  title: {{- if ne $parentFolder "" }}
    {{ printf "%s-Module" ($rootFolderName | replace "-" " ") | quote }}
  {{- else }}
    {{ ($rootFolderName | replace "-" " ") | quote }}
  {{- end }}
{{- end }}
{{- end }}
