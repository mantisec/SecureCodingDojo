{{- define "secure-coding-portal.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{- define "secure-coding-portal.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name -}}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "secure-coding-portal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "secure-coding-portal.labels" -}}
helm.sh/chart: {{ include "secure-coding-portal.chart" . }}
{{ include "secure-coding-portal.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "secure-coding-portal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "secure-coding-portal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "secure-coding-portal.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "secure-coding-portal.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}