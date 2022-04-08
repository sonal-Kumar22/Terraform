All the resources required to provision an EKS cluster:

- VPC
- Subnets -2 (public, private)
- RT - associate subnets to main RT
- route for IGW for RT
- IGW
- IAM role for - eks cluster permissions
- SG 


After creating EKS cluster run following commands in terminal :
- aws configure 
- cd .aws (view config, credentials files are present or not --initially in config if minikube is installed then only it (config file) will be present)
- cd ..
- cd .kube/
- ls -> here inside .kube/ we will be able to view the config file 
- command to add the created cluster in config : aws eks update-kubeconfig --region eu-west-1 --name k8s_cluster_sonal
- verify by : cat config 
- run commands to check whether kubectl commands run properly or not :
  - kubectl get svc (svc = service)
  - kubectl get ns (ns = namespace)