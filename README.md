# Cloud Foundry AWS Bootstrap

Bootstraps a cloud infrastructure for a Cloud Foundry deployment.

## Terraform

Uses [Terraform](https://www.terraform.io/) to plan and apply the necessary setup.
This means that any changes are incremental and seamless.
Ideally the configuration can be reasonably portable between infrastructures but that remains to be seen.

## TODO

* terraform provides [modules](https://www.terraform.io/docs/modules/usage.html), should this repository just be modules that can be integrated, or does CF stand alone enough that this should too?
