# aws-terraform-ansible-docker

This simple project allows to automate the deploy of a docker app in a AWS EC2 instance using Terraform and Ansible

## Configure AWS
### first of all you need to install:
  - AWS CLI
  - Terraform
  - Ansible

to check if everything is correctly installed you can use
  - aws --version
  - terraform --version
  - ansible --version
  
then you need to run the next command:

```aws configure```

then you will have to define your AWS_ACCESS_KEY, AWS_SECRET_KEY and AWS_REGION


## Terraform execution
```terraform init```

```terraform plan```

```terraform apply```

## To destroy infrastructure
```terraform destroy````
