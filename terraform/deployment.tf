provider "kubernetes" {
  host = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
  depends_on = [module.eks]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

resource "kubernetes_deployment_v1" "simple_time_service" {
  metadata {
    name = "simple-time-service"
    labels = {
      app = "simple-time-service"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "simple-time-service"
      }
    }
    template {
      metadata {
        labels = {
          app = "simple-time-service"
        }
      }
      spec {
        container {
          name  = "simple-time-service"
          image = "docker.io/sujay20092002/simple-time-service-application"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "app" {
  metadata {
    name = "demo-app"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.simple_time_service.metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}