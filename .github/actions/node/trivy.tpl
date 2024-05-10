{{- if . }}
<h4>Vulnerabilities</h4>
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
    {{- $currentTarget := .Target }} <!-- Store current Target in a variable -->
    {{- if (eq (len .Vulnerabilities) 0) }}
    <tr>
        <td><code>{{ escapeXML $currentTarget }}</code></td>
        <td colspan="5">No Vulnerabilities found</td>
    </tr>
    {{- else }}
    {{- range .Vulnerabilities }}
    <tr>
        <td><code>{{ escapeXML $currentTarget }}</code></td>
        <td><code>{{ escapeXML .PkgName }}</code></td>
        <td>{{ escapeXML .VulnerabilityID }}</td>
        <td>{{ escapeXML .Severity }}</td>
        <td>{{ escapeXML .InstalledVersion }}</td>
        <td>{{ escapeXML .FixedVersion }}</td>
    </tr>
    {{- end }}
    {{- end }}
    {{- end }}
</table>

<h4>Misconfigurations</h4>
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
    {{- $currentTarget := .Target }} <!-- Store current Target in a variable -->
    {{- if (eq (len .Misconfigurations) 0) }}
    <tr>
        <td><code>{{ escapeXML $currentTarget }}</code></td>
        <td colspan="5">No Misconfigurations found</td>
    </tr>
    {{- else }}
    {{- range .Misconfigurations }}
    <tr>
        <td><code>{{ escapeXML $currentTarget }}</code></td>
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
    {{- end }}
</table>
{{- else }}
<h3>Trivy Returned Empty Report</h3>
{{- end }}