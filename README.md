
# ifechukwudi-logstash-deployment

This project automates the deployment of Logstash using a modular and layered Infrastructure-as-Code approach. It combines **Terraform** for infrastructure provisioning and **Ansible** for configuration management, enabling a reliable, repeatable, and scalable setup.

## Project Structure

├── ansible/                # Ansible playbooks for configuration
├── layered-infra/          # Layered Terraform configuration for environments (e.g., dev, prod)
├── terraform/modules/      # Reusable Terraform modules
├── .gitignore              # Git exclusions
└── README.md               # Project documentation

Features
	•	Infrastructure provisioning using Terraform (modular structure)
	•	Configuration management with Ansible
	•	Layered design for better environment separation
	•	Git-ignored sensitive or state files for secure and clean versioning

Prerequisites
	•	Terraform v1.5+
	•	Ansible v2.10+
	•	AWS CLI (or any cloud provider CLI if customized)
	•	Python 3.x (for Ansible)
	•	SSH access to target machines

Usage

1. Clone the repository

git clone https://github.com/ericobi14/ifechukwudi-logstash-deployment.git
cd ifechukwudi-logstash-deployment

2. Deploy Infrastructure (Terraform)

cd layered-infra/dev  # or prod
terraform init
terraform apply

3. Configure Logstash (Ansible)

cd ansible
ansible-playbook -i inventory logstash-setup.yml

Ensure your SSH keys and Ansible inventory are correctly configured.

Future Improvements
	•	Add automated testing (e.g., Molecule for Ansible)
	•	CI/CD integration
	•	Support for Elasticsearch and Kibana as extensions

Author

Ifechukwudi Obiodiaka
SOC & Cybersecurity | DevSecOps | Infrastructure Automation
