# iGree Infra as Code with Terraform

Automation with Terraform : iGree Infra provision

## Intructions for Google Cloud Platform

### Create credentials.json

> https://console.cloud.google.com/apis/credentials/serviceaccountkey

### Save in you directory

> for example: etc/credentials/credentials.json

### Go to directory of your enviroment, for example: prod

> cd prod

### Set ENV var GOOGLE_APPLICATION_CREDENTIALS

> export GOOGLE_APPLICATION_CREDENTIALS=../etc/credentials/credentials.json

### Initialize a Terraform working directory

> terraform init

### Verify plan

> terraform plan

### If plan is ok, Builds or changes infrastructure

> terraform apply -auto-approve

### If need to destroy

> terraform destroy

### In case of problems to destroy

> terraform plan -destroy -out=destroy.tfplan
> terraform graph -verbose -draw-cycles destroy.tfplan
> terraform apply destroy.tfplan

#### Reference

> https://www.terraform.io/docs/providers/google/index.html
> https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform
> https://www.terraform.io/docs/providers/google/r/compute_firewall.html
> https://www.terraform.io/docs/modules/index.html
> https://github.com/GoogleCloudPlatform/terraform-google-examples/blob/master/example-custom-machine-types/
> https://www.terraform.io/docs/providers/google/r/container_cluster.html
> https://registry.terraform.io/modules/terraform-google-modules/startup-scripts/google/1.0.0