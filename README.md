# 🌍 Terraform Basics

### 🔹 What is Terraform?

* An **Infrastructure as Code (IaC)** tool by HashiCorp.
* Manages cloud, on-prem, and third-party services declaratively.
* Uses **HCL (HashiCorp Configuration Language)**.
* Supports **multi-cloud** (AWS, Azure, GCP, etc.).

### 🔹 Core Concepts

* **Provider** → Plugin for managing resources (AWS, Azure, etc.).
* **Resource** → A cloud service (EC2, VPC, S3 bucket, VM, etc.).
* **Module** → A collection of Terraform files for reuse.
* **State File** → Keeps track of infrastructure (`terraform.tfstate`).
* **Variables & Outputs** → Parameterize and share values.

---

# 📖 Terraform Workflow

1. **Write** – Define infrastructure in `.tf` files.
2. **Init** – Download provider plugins.
3. **Plan** – Preview changes before applying.
4. **Apply** – Create/update resources.
5. **Destroy** – Tear down infrastructure.

---

# 🛠️ Common Terraform Commands

| Command                          | Description                                    |
| -------------------------------- | ---------------------------------------------- |
| `terraform init`                 | Initialize project & download providers        |
| `terraform validate`             | Validate syntax & configuration                |
| `terraform plan`                 | Show what will be created/changed/destroyed    |
| `terraform apply`                | Apply configuration to create/update resources |
| `terraform destroy`              | Destroy all managed infrastructure             |
| `terraform show`                 | Show state or plan                             |
| `terraform state list`           | List resources in state                        |
| `terraform fmt`                  | Format `.tf` files                             |
| `terraform output`               | Show output values                             |
| `terraform taint <resource>`     | Mark resource for recreation                   |
| `terraform import <res> <id>`    | Import existing resource into state            |
| `terraform workspace new <name>` | Create a new workspace (e.g., dev, prod)       |

---

# 📂 Example Terraform Project Structure

```bash
terraform-aws-ec2/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
```

---

# 📝 Code Snippets

### 🔹 AWS Provider & EC2 Example

```hcl
# main.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
  instance_type = "t2.micro"

  tags = {
    Name = "MyFirstEC2"
  }
}
```

### 🔹 Variables Example

```hcl
# variables.tf
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}
```

```hcl
# terraform.tfvars
region        = "us-west-2"
instance_type = "t3.micro"
```

### 🔹 Outputs Example

```hcl
# outputs.tf
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.my_ec2.id
}
```

---

# ⚡ Quick Start

```bash
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```

---
