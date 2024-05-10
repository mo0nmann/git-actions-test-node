{{- if . }}
<h4>Vulnerabilities</h4>
{{- if (eq (len .Vulnerabilities) 0) }}
<p>No Vulnerabilities found</p>
{{- else }}
<table>
    <tr>
        <th>Target</th>
        <th>Package</th>
        <th>ID</th>
        <th>Severity</th>
        <th>Installed Version</th>
        <th>Fixed Version</th>
    </tr>
    {{- range . }}
    {{- range .Vulnerabilities }}
    <tr>
        <td><code>{{ escapeXML $.Target }}</code></td>
        <td><code>{{ escapeXML .PkgName }}</code></td>
        <td>{{ escapeXML .VulnerabilityID }}</td>
        <td>{{ escapeXML .Severity }}</td>
        <td>{{ escapeXML .InstalledVersion }}</td>
        <td>{{ escapeXML .FixedVersion }}</td>
    </tr>
    {{- end }}
    {{- end }}
</table>
{{- end }}

<h4>Misconfigurations</h4>
{{- if (eq (len .Misconfigurations) 0) }}
<p>No Misconfigurations found</p>
{{- else }}
<table>
    <tr>
        <th>Target</th>
        <th>Type</th>
        <th>ID</th>
        <th>Check</th>
        <th>Severity</th>
        <th>Message</th>
    </tr>
    {{- range . }}
    {{- range .Misconfigurations }}
    <tr>
        <td><code>{{ escapeXML $.Target }}</code></td>
        <td>{{ escapeXML .Type }}</td>
        <td>{{ escapeXML .ID }}</td>
        <td>{{ escapeXML .Title }}</td>
        <td>{{ escapeXML .Severity }}</td>
        <td>
          {{ escapeXML .Message }}
          <br><a href={{ escapeXML .PrimaryURL | printf "%q" }}>{{ escapeXML .PrimaryURL }}</a></br>
        </td>
    </tr>
    {{- end }}
    {{- end }}
</table>
{{- end }}
{{- else }}
<h3>Trivy Returned Empty Report</h3>
{{- end }}
