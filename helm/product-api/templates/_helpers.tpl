{{- define "product-api.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "product-api.fullname" -}}
{{- if contains .Chart.Name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "product-api.labels" -}}
app.kubernetes.io/name: {{ include "product-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "product-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "product-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
