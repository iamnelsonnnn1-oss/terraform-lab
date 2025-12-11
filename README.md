# AWS Conceptual MVP Architecture (Terraform Lab)

This project models a scalable, three-tier, serverless architecture using Terraform. It demonstrates best practices for infrastructure-as-code (IaC), networking, compute, and data layers within AWS.

## ⚙️ Technologies Used

| Category | AWS Service/Tool | Description |
| :--- | :--- | :--- |
| **IaC** | Terraform | Used to provision and manage all infrastructure components. |
| **Cloud Provider** | AWS (us-east-1) | The target cloud environment for all resources. |
| **Compute** | AWS Lambda | Serverless compute layer running the application microservice. |
| **Gateway** | AWS API Gateway | The public entry point (HTTP API) routing traffic to the Lambda function. |
| **Database** | AWS RDS (PostgreSQL) | The primary relational database used for application data. |
| **Storage** | AWS S3 | Object storage used for static assets and file management. |
| **Networking** | AWS VPC | The core, isolated virtual network hosting all resources. |
| **Security** | AWS IAM & Security Groups | Provides authorization (IAM roles) and virtual firewall rules (Security Groups). |

## 📐 Architecture Visual

This diagram illustrates the secure top-down connection flow, ensuring the compute and data layers reside securely within the Private Subnets.

<img src="./assets/conceptual_mvp_architecture.png" alt="Conceptual MVP Architecture Diagram" width="800"/>

## 🔗 Connection Flow (Top-Down)

1.  **Internet**
2.  **AWS API Gateway:** Receives public request.
3.  **AWS VPC / Public Subnets:** Traffic passes through the VPC's public entry point.
4.  **AWS Lambda (via Security Groups and IAM):** Executes code, authorized by the IAM Role, after passing through the Security Group rules.
5.  **AWS RDS / AWS S3:** The Lambda connects to these private data resources.

---
## 💻 Final Push Sequence

To finalize the repository and ensure clean history:

1.  Add the new `.gitignore` file and all changes: `git add .`
2.  Commit the final version: `git commit -m "docs: Final architecture and documentation complete."`
3.  Push the clean version, overwriting the old corrupted history: `git push --force`