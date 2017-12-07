# Deploy reddit app in kubernetes cluster

## Structure
`kube` - app manifests
`kubernetes_the_hard_way` - tutorial files
`terraform` - terraform deploy configuration

**Manual deployment:**
1. `cd kube`
2. `kubectl apply -f dev-namespace.yml`
3. `kubectl apply -n dev -f ../kube`

**Terraform deployment:**
1. go to `terraform` directory
2. copy `terraform.tfvars.example` to `terraform.tfvars` and set `google_project` variable with your project id
3. run `terraform init` to configure terraform with required providers
4. check deploy with `terraform plan`
5. deploy k8s cluster with `terraform apply`
