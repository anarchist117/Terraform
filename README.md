# 1. Copy terraform.exe in C:\Terraform
[Windows](https://developer.hashicorp.com/terraform/install?product_intent=terraform#windows)

# 2. User Evironment Variables
```powershell
[Environment]::SetEnvironmentVariable("Path", "$([Environment]::GetEnvironmentVariable("Path", "User"));C:\Terraform", "User")
```

# 3. Configure mirror
```
copy terraform.rc %APPDATA%\
```

# Documentation
[What is Terraform?](https://developer.hashicorp.com/terraform)
