resource "nomad_job" "minio" {
  jobspec = file("${path.module}/conf/nomad/minio.hcl")
  detach = false
}
