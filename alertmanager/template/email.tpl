{{ define "email.default.html" }}

<style type="text/css">
table.gridtable {
  font-family: verdana,arial,sans-serif;
  font-size:11px;
  color:#333333;
  border-width: 1px;
  border-color: #666666;
  border-collapse: collapse;
}

table.gridtable th {
  border-width: 1px;
  padding: 8px;
  border-style: solid;
  border-color: #666666;
  background-color: #dedede;
}

table.gridtable td {
  border-width: 1px;
  padding: 8px;
  border-style: solid;
  border-color: #666666;
  background-color: #ffffff;
}
</style>


<table class="gridtable">
  <tr>
    <th>告警项</th>
    <th>实例</th>
    <th>告警级别</th>
    <th>开始时间</th>
    <th>告警摘要</th>
    <th>详情描述</th>
  </tr>
  {{ range $i, $alert := .Alerts }}
    <tr>
      <td>{{ index $alert.Labels "alertname" }}</td>
      <td>{{ index $alert.Labels "instance" }}</td>
      <td>{{ index $alert.Labels "severity" }}</td>
      <td>{{ ($alert.StartsAt.Add 28800e9).Format "2006-01-02 15:04:05" }}</td>
      <td>{{ index $alert.Annotations "summary" }}</td>
      <td>{{ index $alert.Annotations "description" }}</td>
    </tr>
  {{ end }}
</table>
{{ end }}