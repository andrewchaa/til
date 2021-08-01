# Terraform Getting Started

## Expressions

### String Templates

Interpolation

```terraform
"Hello, ${var.name}"
```

Directives

```terraform
"Hello, %{ if var.name != "" }${var.name}%{ else }unnamed%{ endif }!"

<<EOT
%{ for ip in aws_instance.example.*.private_ip }
server ${ip}
%{ endfor }
EOT
```

Whitespace Stripping

```terraform
<<EOT
%{ for ip in aws_instance.example.*.private_ip ~}
server ${ip}
%{ endfor ~}
EOT
```
