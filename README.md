
## Prerequisites

### Tools

  1. Openlens > https://github.com/MuhammedKalkan/OpenLens
    - Extensions
      - @alebcay/openlens-node-pod-menu
      - lens-certificate-info
      
  2. Others
  - Kubectl > https://kubernetes.io/docs/tasks/tools/
  - Helm > https://helm.sh/docs/intro/install/
  - Tofu > https://opentofu.org/docs/intro/install/
  - Kind > https://github.com/guilhermelinhares/k8s_lab/tree/main/k8s/kind
  - jq > https://jqlang.github.io/jq/download/

### Projects
#### Kind Project
  Clone the kind project 

  ```bash
    git clone https://github.com/guilhermelinhares/k8s_lab.git
  ```

  Go to the project directory

  ```bash
    cd k8s_lab/k8s/kind
  ```

  Initilize a project (In this example a run a project with Multiclusters yaml file)

  ```bash
    kind create cluster --name k8s-lab --config kind-multiclusters.yaml
    
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

    kubectl wait --namespace ingress-nginx \
      --for=condition=ready pod \
      --selector=app.kubernetes.io/component=controller \
      --timeout=90s
  

### Initialize Project
`tofu init`

### Run project
`tofu apply`