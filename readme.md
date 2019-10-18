# Revize Aws Setup Automation

## Building your AMI for Windows Server

* Launch ec2 instance with the provided AMI image
* Connect to ec2 instance and configure desired features and deploy initial website content
* Shut down the instance
* Create [custom AMI](https://aws.amazon.com/premiumsupport/knowledge-center/sysprep-create-install-ec2-windows-amis/) from the configured instance

## One-time local setup

* Have handy or generate new [access key and secret](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) for your account
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


### TODO:

1. scheduled task did not get enabled on failover
1. ~/.aws/config did not include key/secret
1. did not verify machine env vars were set
