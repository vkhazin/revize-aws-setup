# Revize Aws Setup Automation

## Building your AMI for Windows Server

* Launch ec2 instance with the desired operating system
* Connect to ec2 instance and configure desired features
* Shut down the instance
* Create [custom AMI](https://aws.amazon.com/premiumsupport/knowledge-center/sysprep-create-install-ec2-windows-amis/) from the configured instance

## One-time local setup

* Clone the repo
* Run in terminal: `find . -name "*.sh" -exec chmod +rx {} \; && ./scripts/local-setup-macos.sh`
* Update [./envs/global.sh](./envs/global.sh) to reflect the new bucket name

## Before Deployment

* [Create an s3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html) to store terraform state in the desired region
* [Create ssh key pair](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-keypairs.html) in the desired region to decrypt Windows Administrator password
* Copy custom AMI id created in the previous steps
* Update [./envs/global.sh](./envs/global.sh) to reflect the new values

## Deployment

* To verify without applying: `./scripts/plan.sh dev`
* To create/update a deployment: `./scripts/apply.sh dev`
* To delete an existing deployment: `./scripts/destroy.sh dev`
