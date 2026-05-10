# IaC with Terraform on AWS
A sample project demonstrating Infrastructure as Code (IaC) principles using Terraform for AWS deployment.

## 🛠 Setup & Installation
This guide covers a **dedicated drive installation** (e.g., `D:` drive). If you prefer a default installation, please follow the official documentation.

### 1. Terraform Configuration
*   **Download:** Get the binary from the [Official Website](https://developer.hashicorp.com/terraform/install).
*   **Install:** Unzip the file into `D:\Terraform` (contains `terraform.exe`).
*   **Environment Path:** Add `D:\Terraform` to your system's **PATH** variable.
*   **Verification:** Open a terminal and run `terraform -version` to confirm.

#### Optimization (CLI Config)
Create a file named `terraform.rc` in `D:\Terraform\` to enable local caching and disable update checks:

```hcl
plugin_cache_dir   = "D:/Development/Terraform/plugin-cache"
disable_checkpoint = true
```

Set the following **System Environment Variables**:
*   `TF_CLI_CONFIG_FILE` → `D:\Terraform\terraform.rc`
*   `TF_DATA_DIR` → `D:\Terraform\.terraform.d`

---

### 2. AWS CLI Configuration
*   **Download:** [AWS CLI V2 Installer](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
*   **Install:** Choose your custom path (e.g., `D:\AWS_CLI_V2`).
*   **Environment Variables:** Redirect configuration and credentials to your dedicated drive:
    *   `AWS_CONFIG_FILE` → `D:\AWS_CLI_V2\.aws\config`
    *   `AWS_SHARED_CREDENTIALS_FILE` → `D:\AWS_CLI_V2\.aws\credentials`

---

## 🚀 Quick Start

### 1. Project Initialization
Navigate to the sample directory and initialize Terraform:
1.  **Change directory:** `cd iac-terraform/01-sample`
2.  **Initialize:** `terraform init`
3.  **Plan:** `terraform plan`

### 2. AWS Authentication (If you get an error)
If the plan fails with an authentication error, you need to configure your AWS credentials:
1.  **Log in** to the [AWS Web Console](https://amazon.com).
2.  **Navigate to IAM:** Find your user (or create a new one).
3.  **Create Access Key:** Under "Security credentials," create a new **Access key**.
4.  **Copy keys:** Temporarily save the **Access Key ID** and **Secret Access Key**.
5.  **Configure CLI:** Back in your terminal, run:
    ```bash
    aws configure
    ```
6.  **Enter details:** Paste your keys and set your preferred region (e.g., `us-east-1`) when prompted.

### 3. Deployment
Once authenticated, you can deploy the resources:
1.  **Deploy:** `terraform apply`
