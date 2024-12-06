# 3-Tier-Highly-Available-and-Scalable-AWS-Infrastructure-using-Terraform-Project


## **Introduction**

This project sets up an AWS infrastructure using Terraform's Infrastructure-as-Code (IaC) approach. It includes the following components:

1. A Virtual Private Cloud (VPC) with public and private subnets across multiple Availability Zones.
2. EC2 instances in an Auto Scaling group.
3. Security Groups to control traffic for resources.
4. Routing tables and their associations.
5. An RDS database instance in private subnets.

The project adheres to Terraform best practices:

- **Modular Design**: Separate modules for VPC, Subnets, EC2, Security Groups, Routing Tables, Routing Table Associations, and RDS.
- **No Hard Coding**: Configuration is parameterized using variables.
- **Remote State Management**: Utilizes Terraform's backend for state storage.

---

## **Project Structure**

```
├── root-module/
│   ├── backend.tf          # Configures the remote backend for state storage
│   ├── main.tf             # Root module configuration
│   ├── outputs.tf          # Outputs for the entire infrastructure
│   ├── provider.tf         # AWS provider configuration
│   ├── variables.tf        # Variables for the root module
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf         # VPC resources
│   │   ├── outputs.tf      # Outputs for the VPC
│   │   ├── variables.tf    # Input variables for VPC
│   │
│   ├── subnets/
│   │   ├── main.tf         # Subnets resources
│   │   ├── outputs.tf      # Outputs for Subnets
│   │   ├── variables.tf    # Input variables for Subnets
│   │
│   ├── ec2/
│   │   ├── main.tf         # EC2 instance configuration
│   │   ├── outputs.tf      # Outputs for EC2 instances
│   │   ├── variables.tf    # Input variables for EC2
│   │
│   ├── security-groups/
│   │   ├── main.tf         # Security Group configuration
│   │   ├── outputs.tf      # Outputs for Security Groups
│   │   ├── variables.tf    # Input variables for Security Groups
│   │
│   ├── routing-tables/
│   │   ├── main.tf         # Routing Table configuration
│   │   ├── outputs.tf      # Outputs for Routing Tables
│   │   ├── variables.tf    # Input variables for Routing Tables
│   │
│   ├── routing-table-associations/
│   │   ├── main.tf         # Route Table association configuration
│   │   ├── outputs.tf      # Outputs for associations
│   │   ├── variables.tf    # Input variables for associations
│   │
│   ├── rds/
│       ├── main.tf         # RDS instance configuration
│       ├── outputs.tf      # Outputs for RDS
│       ├── variables.tf    # Input variables for RDS
```

---

## **Features**

1. **VPC**:
    
    - Creates a VPC with public and private subnets across multiple Availability Zones.
    - Includes an Internet Gateway for public subnets.
2. **EC2 Instances**:
    
    - Auto Scaling group of EC2 instances in public subnets.
    - Instances are parameterized for AMI, instance type, key pair, and more.
3. **Security Groups**:
    
    - Configures ingress and egress rules for EC2 and RDS instances.
4. **Routing**:
    
    - Creates routing tables for public and private subnets.
    - Associates subnets with the appropriate routing tables.
5. **RDS Database**:
    
    - Deploys an RDS instance in private subnets.
    - Configurable for engine, storage, instance class, username, and password.
6. **Remote State**:
    
    - Stores Terraform state remotely for collaboration and state management.

---

## **Pre-Requisites**

1. Install the following tools:
    - [Terraform](https://www.terraform.io/downloads)
    - AWS CLI
2. Configure your AWS credentials:
    
    ```bash
    aws configure
    ```
    
3. Set up the following environment variables for sensitive information:
    - `TF_VAR_db_username`: RDS database username.
    - `TF_VAR_db_password`: RDS database password.

---

## **Configuration**

### **Root Module Variables**

The root module defines variables that are passed to the sub-modules. You can configure these in a `terraform.tfvars` file or pass them directly during execution. Below are the key variables:

|Variable|Description|Default Value|
|---|---|---|
|`region`|AWS region for the resources|`us-east-1`|
|`availability_zones`|List of availability zones|`["us-east-1a", "us-east-1b"]`|
|`vpc_cidr`|CIDR block for the VPC|`10.0.0.0/16`|
|`public_subnet_cidrs`|CIDR blocks for public subnets|`["10.0.1.0/24", "10.0.2.0/24"]`|
|`private_subnet_cidrs`|CIDR blocks for private subnets|`["10.0.3.0/24", "10.0.4.0/24"]`|

---

## **Usage**

### **1. Initialize Terraform**

Run the following command to initialize the Terraform configuration and download provider plugins:

```bash
terraform init
```

### **2. Plan the Infrastructure**

Generate an execution plan to preview the resources to be created:

```bash
terraform plan
```

### **3. Apply the Configuration**

Deploy the resources in AWS:

```bash
terraform apply
```

### **4. Destroy the Infrastructure**

To tear down the infrastructure, run:

```bash
terraform destroy
```

---

## **Outputs**

The infrastructure provides the following outputs:

|Output Name|Description|
|---|---|
|`vpc_id`|ID of the created VPC|
|`public_subnets`|List of public subnet IDs|
|`private_subnets`|List of private subnet IDs|
|`ec2_instance_ids`|List of EC2 instance IDs|
|`rds_endpoint`|Endpoint of the RDS instance|

---

## **Notes**

- Ensure your AWS credentials are properly configured and have the necessary permissions to create the required resources.
- The configuration assumes a default setup for simplicity. You can modify variables to customize the infrastructure.

---

## **Future Enhancements**

- Add support for monitoring (CloudWatch alarms, metrics).
- Implement load balancing with an AWS Application Load Balancer (ALB).
- Add Elastic Block Storage (EBS) volumes for EC2 instances.

---

Feel free to customize the infrastructure according to your requirements! If you encounter any issues or have suggestions, please open an issue or submit a pull request.

---

### **End of Documentation**
