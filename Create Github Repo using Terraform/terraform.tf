#create a github repository using terraform

#provider file
provider "github" {
    token = "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"
}

#repository creation block
resource "github_repository" "exampleRepo" {
  name        = "Repo-creation-using-Terraform"
  description = "Creating github repository using terraform"
  visibility = "public"
#to create readme file
  auto_init = true
}
