# Cloud Foundry AWS Bootstrap

Bootstraps a cloud infrastructure for a Cloud Foundry deployment.

## Setup

Terraform cannot create an access key or keypair, so those must be created manually.
Follow the appropriate steps of "Prepare an AWS Account" in the [official documentation](http://docs.cloudfoundry.org/bosh/deploy-microbosh-to-aws.html) to create an access key and a keypair.

## Usage

    export AWS_ACCESS_KEY_ID=<access_key> AWS_SECRET_ACCESS_KEY=<secret_key>
    bin/bootstrap-aws

### Configuration

Configuration is done with environment variables:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_REGION` (defaults to `us-west-1`)
* `AWS_AVAILABILITY_ZONE` (defaults to `us-west-1a`)

Arguments are passed through to terraform so more customization can be achieved with additional arguments.

## Terraform

Uses [Terraform](https://www.terraform.io/) to plan and apply the necessary setup.
This means that any changes are incremental and seamless.
Ideally the configuration can be reasonably portable between infrastructures but that remains to be seen.

## TODO

* terraform provides [modules](https://www.terraform.io/docs/modules/usage.html), should this repository just be modules that can be integrated, or does CF stand alone enough that this should too?
