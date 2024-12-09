config:
  users:
     - username: "victoria-metrics-server"
       password: ${pwd_metric_log}
       url_prefix: "http://victoria-metrics.victoria-system.svc.cluster.local:8428"
     - username: "victoria-metrics-logs"
       url_prefix: "http://victoria-metrics-logs-victoria-logs-single-server.victoria-system.svc.cluster.local:9428"
       password: ${pwd_metric_log}
  ingress:
  enabled: ${ingress_enabled}
  annotations:
    cert-manager.io/issuer: ${issuer_name}
    cert-manager.io/issuer-kind: ${issuer_kind}
    cert-manager.io/issuer-group: cert-manager.k8s.cloudflare.com
    external-dns.alpha.kubernetes.io/cloudflare-proxied: 'true'
    external-dns.alpha.kubernetes.io/hostname: vmauth.${domain_name}
  hosts:
    - name: vmauth.${domain_name}
      path:
        - /
      port: http
  tls:
    - secretName: vmauth-${dash_domain_name}
      hosts:
        - grafana.${domain_name}
  ingressClassName: ${ingress_class_name}
resources:
    limits:
      cpu: ${limits_cpu}
      memory: ${limits_memory}
    requests:
      cpu: ${request_cpu}
      memory: ${request_memory}