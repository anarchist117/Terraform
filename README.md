# 1. Copy terraform.exe in C:\Terraform
[Windows](https://developer.hashicorp.com/terraform/install?product_intent=terraform#windows)

# 2. System Properties => Advanced => Evironment Variables => User variables
```powershell
[Environment]::SetEnvironmentVariable("Path", "$([Environment]::GetEnvironmentVariable("Path", "User"));C:\Terraform", "User")
```

# 3. Configure mirror
```
copy terraform.rc %APPDATA%\
```

# Documentation
[What is Terraform?](https://developer.hashicorp.com/terraform)
