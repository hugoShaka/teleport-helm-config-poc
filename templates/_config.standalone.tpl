{{ define "config.standalone" -}}
teleport:
  log:
    severity: INFO
    output: stderr
    format:
      output: text
      extra_fields: ["timestamp","level","component","caller"]
auth_service:
  enabled: true
  cluster_name: {{ .Values.clusterName }}
  authentication:
    type: "local"
    local_auth: true
    second_factor: "otp"
kubernetes_service:
  enabled: true
  listen_addr: 0.0.0.0:3027
  kube_cluster_name: {{ .Values.clusterName}}
proxy_service:
  enabled: false
ssh_service:
  enabled: false
{{ end }}
