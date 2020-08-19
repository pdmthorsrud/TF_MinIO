job "minio" {
  datacenters = ["dc1"]
  group "minio" {
    network {
      mode ="bridge"
      port "http" {
        static = 9001
        to = 9000
      }
    }

    service {
      name = "count-dashboard"

      check {
        name     = "dashboard-alive"
        port     = "http"
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "dashboard" {
      driver = "docker"
      artifact {
        source = "s3::http://127.0.0.1:9000/dev/tmp/minio.tar"
        options {
          aws_access_key_id     = "minioadmin"
          aws_access_key_secret = "minioadmin"
        }
      }
      config {
        load = "minio.tar"
        image = "minio:local"
        memory_hard_limit = 2048
        args = [
          "server", "/local/data", "-address", "127.0.0.1:9000"
        ]
      }
    }
  }
}
