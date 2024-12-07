Here’s a practical scenario to help you practice Terraform commands. It involves creating and managing AWS infrastructure, but you can adapt it to other providers like Azure or Google Cloud. The scenario will guide you through using Terraform commands in a real-world-like situation.

Scenario: Setting Up an AWS EC2 Instance with a Security Group

Objective:
	•	Use Terraform to provision an EC2 instance.
	•	Attach a security group that allows HTTP (port 80) and SSH (port 22) access.
	•	Learn Terraform commands throughout the process.

Steps:

1. Write the Terraform Configuration

Create a directory for your Terraform project (e.g., terraform-ec2-demo) and add the following files:

main.tf:

provider "aws" {
  region = "us-east-1" # Change as needed
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (Change if needed)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }

  security_groups = [aws_security_group.web_sg.name]
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variables.tf:

variable "region" {
  default = "us-east-1"
}

2. Practice Terraform Commands

Follow these steps to practice Terraform commands:

a. Initialize Terraform

terraform init

	•	Downloads the required provider plugins.
	•	Prepares the directory for use with Terraform.

b. Validate the Configuration

terraform validate

	•	Checks the syntax and configuration files for errors.

c. Format the Code

terraform fmt

	•	Automatically formats your configuration files for better readability.

d. Plan the Deployment

terraform plan

	•	Generates and shows the execution plan.
	•	Confirms what Terraform will create, modify, or delete.

e. Apply the Deployment

terraform apply

	•	Deploys the infrastructure.
	•	You will be prompted to confirm before proceeding.

f. Inspect the State

terraform show

	•	Displays information about the resources Terraform manages.

g. List State Resources

terraform state list

	•	Lists all resources tracked in the Terraform state.

h. Update Resources (Optional)
Edit the main.tf file, such as changing the instance_type to t3.micro. Then:

terraform apply

	•	Apply the updated configuration.

i. Destroy the Infrastructure

terraform destroy

	•	Removes all resources created by Terraform.

Additional Commands for Practice
	•	Output Variables:
Add an output block to the main.tf file:

output "instance_id" {
  value = aws_instance.web.id
}

After applying, use:

terraform output


	•	State Management:

terraform state show aws_instance.web
terraform state rm aws_instance.web
terraform import aws_instance.web i-0abcd1234efgh5678


	•	Terraform Graph:

terraform graph | dot -Tpng > graph.png

	•	Visualize the resource dependency graph.

Challenge
	1.	Add a second EC2 instance using the same security group.
	2.	Use Terraform variables to make the configuration more dynamic.
	3.	Experiment with remote state storage (e.g., S3 for AWS).

Let me know if you need more tasks or help with a specific step!
