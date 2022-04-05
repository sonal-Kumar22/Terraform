Provider for github link : https://registry.terraform.io/providers/integrations/github/latest/docs

Resource creation - repository : https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository

auto_init : to create readme file 

Steps to activate authentication key or token in github to be used in terraform :
- go to account
- go to setting
- go to developer settings
- choose personal access tokens
- generate tokens

Video referred : https://www.youtube.com/watch?v=dbQHjnAOzrs&list=PL6XT0grm_TfgdaAjTmLb4QedMCCMQHISm&index=23

Command to destroy just 1 resource among the many resources :
- terraform destroy --target resource-name.resource-variable

Ex: terraform destroy --target github_repository.exampleRepo

Q) Why does the github access key gets revoked in minutes after execution..?

