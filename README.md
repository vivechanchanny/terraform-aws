# Terraform AWS Infrastructure as Code (IaC) Proof of Concept

This project aims to demonstrate the power and flexibility of Terraform for provisioning and managing infrastructure on Amazon Web Services (AWS). By utilizing Terraform's declarative configuration language, infrastructure components such as virtual private clouds (VPCs), EC2 instances, load balancers, and more can be defined as code, enabling automation, repeatability, and scalability in cloud deployments.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Testing](#testing)
- [Deployment](#deployment)
- [Known Issues](#known-issues)
- [License](#license)

## Overview

In this Proof of Concept (PoC), we'll showcase how Terraform can be used to:

Provision of a VPC with multiple subnets across different availability zones.
Deploy EC2 instances with custom configurations, including instance types, AMIs, and security groups.
Create application load balancers (ALBs) and attach them to EC2 instances.
Manage networking configurations, including route tables, internet gateways, and NAT gateways.
Demonstrate best practices for infrastructure as code development, including code organization, versioning, and collaboration.

## Installation
To get started with this project, follow these steps:

Clone the repository to your local machine:
```sh
git clone https://github.com/vivechanchanny/terraform-aws.git
```
Install Terraform by following the official installation instructions.

Configure your AWS credentials using one of the following methods:

AWS CLI
Environment variables (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY)
IAM roles (when running Terraform on an EC2 instance)

## Usage

Once you've installed Terraform and configured your AWS credentials, you can use the provided Terraform configurations to deploy infrastructure:

### Navigate to the project directory:
```sh
cd terraform-aws
```
### Initialize Terraform:
```sh
terraform init
```
### Review the execution plan:

```sh
terraform plan -out-tfplan
```
### Apply the Terraform configuration:

terraform apply tfplan
Confirm the changes and proceed with the deployment by typing yes when prompted.

## Configuration

The Terraform configurations in this project are organized into modules, each responsible for provisioning a specific set of resources. You can customize these configurations by modifying the corresponding .tf files or by providing input variables.

## Troubleshooting

If you encounter any issues or errors during the deployment process, refer to the troubleshooting section of the README.md file for guidance on resolving common problems.

## Contributing

If you welcome contributions from the community, provide guidelines on how users can contribute to the project. This can include information on how to submit bug reports, feature requests, or pull requests, as well as any coding standards or contribution guidelines.

## Testing

The project includes automated tests to validate the correctness and reliability of the Terraform configurations. To run the tests, execute the following command:

```sh
terraform validate
```
## Deployment

The Terraform configurations can be deployed to any AWS account by following the installation and usage instructions provided in this README.md file.

## Known Issues



## License

