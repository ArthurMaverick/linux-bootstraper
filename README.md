
# Ansible Playbook for Setting Up a Development Environment

This Ansible playbook automates the installation of various services and tools commonly used in a development environment.

## Table of Contents

- [Ansible Playbook for Setting Up a Development Environment](#ansible-playbook-for-setting-up-a-development-environment)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  - [Installed Services](#installed-services)
  - [Folder Structure](#folder-structure)
  - [AWS Configuration](#aws-configuration)
  - [AWS Vault](#aws-vault)
  - [NeoVim Configuration](#neovim-configuration)
  - [Pre Commit](#pre-commit)

## Prerequisites

- Ansible installed on the control machine.
- Appropriate permissions to execute Ansible tasks on target hosts.

## Usage

1. Clone this repository to your local machine.
   ```bash
   git clone https://github.com/ArthurMaverick/linux-bootstraper.git
   cd linux-bootstraper
   ```

2. Update the `inventory` file with your target hosts.

3. Run the Ansible playbook:
   ```bash
   ansible-playbook -i inventory/proxmox/servers.yaml playbooks/rocky_bootstrap.yaml -v
   ```


## Installed Services

The playbook installs the following services:

- **SSH**: Installs and configures OpenSSH server.
- **Firewall**: Installs firewalld and configures it to allow SSH.
- **Docker**: Installs Docker Engine and adds the user to the docker group.
- **Git**: Installs Git.
- **Terraform**: Installs Terraform.
- **Kubectl**: Installs Kubernetes kubectl.
- **K9s**: Installs K9s, a Kubernetes CLI.
- **Fonts**: Downloads and installs NerdFonts for a better terminal experience.
- **Zsh**: Installs Zsh, Oh-My-Zsh, Powerlevel10k theme, and plugins.
- **Go**: Installs Golang.
- **Folder Structure**: Creates project directories.
- **AWS CLI and AWS Vault**: Installs and configures the AWS CLI and AWS Vault.
- **NeoVim**: (Include additional information about NeoVim configuration.)

## Folder Structure

The playbook creates the following directory structure:

- `/root/projects`
- `/root/templates`
- `/root/scripts`
- `/root/config`

## AWS Configuration

The playbook installs the AWS CLI and configures it. (Include additional details if necessary.)

## AWS Vault

Installs and configures AWS Vault for secure AWS credentials management.

## NeoVim Configuration

(Include additional information about NeoVim configuration if applicable.)

## Pre Commit
Install and pre-commit to keep best practices on terraform and yaml and golang services