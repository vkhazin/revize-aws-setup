# Revise Aws Setup Automation

## One-time local setup

* Clone the repo
* Run in terminal: `find . -name "*.sh" -exec chmod +rx {} \; && ./scripts/local-setup-macos.sh`
* Create a new S3 bucket to store the terraform state
* Update [./envs/global.sh](./envs/global.sh) to reflect the new bucket name

## Deployment

* To verify without applying: `./scripts/plane.sh dev`
* To create/update an environment: `./scripts/apply.sh dev`
* To delete the deployment: `./scripts/destroy.sh dev`
