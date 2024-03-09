project_name       = "hello"
environment        = "dev"
source_repo_name   = "hello-repo"
source_repo_branch = "master"
create_new_repo    = true
repo_approvers_arn = "arn:aws:sts::738024653060:assumed-role/AWSReservedSSO_AWSAdministratorAccess_ae5a0f5d8b1fe90b/zchen@commoninf.com"
create_new_role    = true
codepipeline_iam_role_name = "hello-codepipeline_iam_role"
stage_input = [
  { name = "validate", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "SourceOutput", output_artifacts = "ValidateOutput" },
  { name = "apply", category = "Build", owner = "AWS", provider = "CodeBuild", input_artifacts = "SourceOutput", output_artifacts = "ApplyOutput" }
]
build_projects = ["validate", "plan", "apply", "destroy"]