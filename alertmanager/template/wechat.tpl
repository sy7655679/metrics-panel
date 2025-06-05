{{ $var := .externalURL}}{{ range $k,$v:=.alerts }}
{{if eq $v.status "resolved"}}
✅ [Prometheus恢复信息]({{$v.generatorURL}})
{{else}}
⚠️ [Prometheus告警信息]({{$v.generatorURL}})
{{end}}
>**[{{$v.labels.alertname}}]({{$var}})**
>告警级别: {{$v.labels.severity}}
{{- if $v.labels.all }}
>故障主机: {{ $v.labels.all }}{{ end }}
>故障地址: {{ $v.labels.instance }}
>开始时间: {{ $v.startsAt.Local.Format "2006-01-02 15:04:05" }}
{{- if eq $v.status "resolved"}}
>恢复时间: {{ $v.endsAt.Local.Format "2006-01-02 15:04:05" }}{{ end }}
>告警摘要: {{ $v.annotations.summary }}
{{ end }}