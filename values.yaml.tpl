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