# 1. Copy terraform.exe in C:\Terraform
[Windows](https://releases.hashicorp.com/terraform/1.11.3/terraform_1.11.3_windows_amd64.zip)

# 2. System Properties => Advanced => Evironment Variables => User variables
```powershell
[Environment]::SetEnvironmentVariable("Path", "$([Environment]::GetEnvironmentVariable("Path", "User"));C:\Terraform", "User")
```

# 3. Configure mirror
copy terraform.rc %APPDATA%\

# Documentation
[What is Terraform?](https://developer.hashicorp.com/terraform)
