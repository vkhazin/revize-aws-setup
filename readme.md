# Revise Aws Setup Automation

## One-time local setup

* Clone the repo
* Run in terminal: `find . -name "*.sh" -exec chmod +rx {} \; && ./scripts/local-setup-macos.sh`
* Create a new S3 bucket to store the terraform state
* Update [./envs/global.sh](./envs/global.sh) to reflect the new bucket name

## Before Deployment

* [Create an s3 bucket(https://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html)] to store terraform state in the desired region
* Create [ssh key pair](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-keypairs.html) in the desired region to decrypt Windows passwords
* Update [./envs/global.sh](./envs/global.sh) to reflect the new values

## Deployment

* To verify without applying: `./scripts/plane.sh dev`
* To create/update a deployment: `./scripts/apply.sh dev`
* To delete the deployment: `./scripts/destroy.sh dev`
