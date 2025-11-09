# Cloud Engineer Project (Local Only) — LocalStack + Terraform + Docker

Run a full cloud-style stack on your laptop with **no AWS account**:
- Backend: Python Flask in Docker
- AWS Emulation: LocalStack
- IaC: Terraform (targets LocalStack endpoints)
- CI (optional): GitHub Actions workflow for local build/test

## Quick Start
1) Install: Docker, Terraform, Git, Python 3 (optional), Make (optional)
2) Start services:
   ```bash
   docker compose up -d
   ```
3) Build & run backend locally (optional):
   ```bash
   docker build -t localapp:latest ./backend
   docker run -p 5000:5000 localapp:latest
   # Visit http://localhost:5000
   ```
4) Provision local AWS resources with Terraform (targets LocalStack):
   ```bash
   cd terraform
   terraform init
   terraform plan
   terraform apply -auto-approve
   # Show outputs
   terraform output
   ```
5) Verify S3 in LocalStack (no AWS creds required):
   ```bash
   docker exec -it localstack awslocal s3 ls
   docker exec -it localstack awslocal s3 ls s3://local-cloud-demo
   ```

## What gets created
- S3 bucket: `local-cloud-demo`
- S3 object: `hello.txt` (content: "Hello Local Cloud!")
- CloudWatch Log Group: `/local/demo`

## Tear down
```bash
cd terraform
terraform destroy -auto-approve
docker compose down -v
```

## Notes
- Everything runs locally; **no AWS charges**.
- You can expand Terraform to add IAM, DynamoDB, SQS, etc. LocalStack supports many services.