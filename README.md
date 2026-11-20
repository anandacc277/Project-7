# Terraform CI Validation Demo

[![Terraform CI Validation](https://github.com/anandacc277/Project-7/actions/workflows/terraform-validate.yml/badge.svg)](https://github.com/anandacc277/Project-7/actions/workflows/terraform-validate.yml)

This project demonstrates Infrastructure as Code (IaC) CI/CD pipeline with automated Terraform checks.

## 📋 Overview

This repository includes:
- **Terraform Configuration**: AWS S3 bucket with security best practices
- **GitHub Actions Workflow**: Automated validation on every push and pull request
- **CI/CD Checks**:
  - `terraform fmt` - Code formatting validation
  - `terraform validate` - Configuration syntax and logic validation

## 🏗️ Infrastructure

The Terraform configuration provisions:
- **S3 Bucket** with:
  - Versioning enabled
  - Server-side encryption (AES256)
  - Public access blocked
  - Proper tagging

## 📂 Project Structure

```
.
├── main.tf              # Primary Terraform configuration
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── .gitignore           # Git ignore rules for Terraform
├── .github/
│   └── workflows/
│       └── terraform-validate.yml  # GitHub Actions workflow
└── README.md            # This file
```

## 🔄 CI/CD Pipeline

### Workflow Triggers
- **On Push**: Automatic validation on commits to `main` and `develop` branches
- **On Pull Request**: Validation before merge to ensure code quality

### Validation Steps

1. **Checkout Code**: Retrieves the latest repository code
2. **Setup Terraform**: Installs Terraform v1.6.0
3. **Format Check**: Validates code formatting with `terraform fmt -check`
4. **Configuration Validation**: Checks syntax and logic with `terraform validate`
5. **PR Comments**: Posts validation results as PR comments

### Pipeline Status
Check the **[Actions](./../../actions)** tab to view workflow runs and their status.

## 🚀 Usage

### Local Validation

Before committing, validate locally:

```bash
# Check formatting
terraform fmt -check -recursive

# Fix formatting (if needed)
terraform fmt -recursive

# Validate configuration
terraform init -backend=false
terraform validate
```

### Deploy

```bash
# Initialize Terraform
terraform init

# Plan changes
terraform plan -out=tfplan

# Apply changes
terraform apply tfplan
```

## 📋 Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region for resources | `us-east-1` |
| `bucket_name` | Name of the S3 bucket | `my-terraform-demo-bucket` |
| `environment` | Environment name (dev/staging/prod) | `dev` |

## 📤 Outputs

| Output | Description |
|--------|-------------|
| `bucket_id` | The name of the S3 bucket |
| `bucket_arn` | The ARN of the S3 bucket |
| `bucket_region` | The AWS region of the bucket |

## 🛠️ GitHub Actions Badge

The badge at the top shows the current status of the Terraform validation workflow:
- 🟢 **Green**: All checks passed
- 🔴 **Red**: Validation failed
- 🟡 **Yellow**: Workflow in progress

Click the badge to view detailed workflow logs.

## 📝 Notes

- The workflow only runs on file changes in Terraform files (`.tf`, `.tfvars`)
- Format check failures will comment on PRs with helpful messages
- All validation must pass before merging to main branch

## 👤 Author

Anand Kasaudhan

## 📄 License

MIT
