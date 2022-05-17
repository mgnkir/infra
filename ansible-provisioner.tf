module "ansible_provisioner" {
  source    = "github.com/cloudposse/tf_ansible"
  playbook  = "${path.module}/playbook.yml"
  dry_run   = false
  arguments = [
    "-vvv",
    "--user=${var.user}",
    "--private-key=${path.module}/id_rsa",
  ]
  envs      = [
    "host=${yandex_compute_instance.peervpn.network_interface[0].nat_ip_address}",
    "user=${var.user}",
  ]
}
