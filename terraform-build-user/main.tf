module "iam_user" {
  source = "github.com/cisagov/ami-build-iam-user-tf-module"

  providers = {
    aws                       = aws
    aws.images-production-ami = aws.images-production-ami
    aws.images-staging-ami    = aws.images-staging-ami
    aws.images-production-ssm = aws.images-production-ssm
    aws.images-staging-ssm    = aws.images-staging-ssm
  }

  ssm_parameters = [
    "/vnc/username",
    "/vnc/password",
    "/vnc/ssh/ed25519_public_key",
    "/vnc/ssh/ed25519_private_key",
  ]
  user_name = "build-pca-gophish-composition-packer"
}
