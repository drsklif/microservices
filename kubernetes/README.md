# Deploy reddit app in kubernetes cluster

## Structure
`kube` - app manifests
`kubernetes_the_hard_way` - tutorial files
`terraform` - terraform deploy configuration

**Cluster deployment:**
1. go to `terraform` directory
2. copy `terraform.tfvars.example` to `terraform.tfvars` and set `google_project` variable with your project id
3. run `terraform init` to configure terraform with required providers
4. check deploy with `terraform plan`
5. deploy k8s cluster with `terraform apply`
6. add network-policy addon for GKE `gcloud beta container clusters update <cluster-name> --zone=europe-west1-d --update-addons=NetworkPolicy=ENABLED`
7. enable network-policy for GKE `gcloud beta container clusters update <cluster-name> --zone=europe-west1-d --enable-network-policy`

**Pods and services deployment:**
1. go to `kube` directory
2. run `gcloud compute disks create --size=25GB --zone=europe-west1-d reddit-mongo-disk` (required for manual volumes configuration)
3. create dev namespace `kubectl apply -f dev-namespace.yml`
4. create certificate and private key `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=GKE cluster"`
5. create tls secret ```sed "s/TLS_CRT/\`cat tls.crt|base64 -w0\`/g" ui-ingress-secret.yml.tmpl | \
sed "s/TLS_KEY/\`cat tls.key|base64 -w0\`/g" > ui-ingress-secret.yml```
6. create ingress secret `kubectl apply -n dev -f ui-ingress-secret.yml`
7. create all services and volumes in dev namespace `kubectl apply -n dev -f services -R=true`
8. wait 5-10 minutes and get ingress ip `kubectl get ingress -n dev`
9. browse to https://your_ingress_ip/
