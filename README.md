# Terraform Lab Architecture

This diagram shows the current staged AWS provider integration.

```mermaid
graph TD
    Provider["Terraform AWS Provider"]
    EC2["EC2 Instance"]
    S3["S3 Bucket"]

    Provider --> EC2
    Provider --> S3
```