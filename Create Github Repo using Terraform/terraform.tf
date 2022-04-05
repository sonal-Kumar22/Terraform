#create a github repository using terraform

#repository creation block 1
resource "github_repository" "exampleRepo" {
  name        = "Repo-creation-using-Terraform"
  description = "Creating github repository using terraform"
  visibility = "public"
#to create readme file automatically with repo creation
  auto_init = true
}

#repository creation block 2
resource "github_repository" "exampleRepo2" {
  name        = "Repo-creation-using-Terraform-2"
  description = "Creating github repository using terraform"
  visibility = "public"
#to create readme file automatically with repo creation
  auto_init = true
}
