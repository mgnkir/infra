resource "yandex_vpc_network" "peervpn-net" {
  name = "peervpn-net"
  folder_id = local.yandex.folder_id
}

resource "yandex_vpc_subnet" "peervpn-subnet" {
  zone = local.yandex.zone
  folder_id = local.yandex.folder_id
  network_id = yandex_vpc_network.peervpn-net.id
  v4_cidr_blocks = local.yandex.instance.private_cidr
}

resource "yandex_compute_instance" "peervpn" {
  zone = local.yandex.zone
  folder_id = local.yandex.folder_id
  platform_id = local.yandex.instance.platform_id
  allow_stopping_for_update = true
  metadata = {
    user-data = "${file("${path.module}/users.txt")}"
  }
  boot_disk {
    initialize_params {
      image_id = local.yandex.hdd.image_id
      size = local.yandex.hdd.size
      type = local.yandex.hdd.type
    }
  }
  network_interface {
    nat	= true
    subnet_id = yandex_vpc_subnet.peervpn-subnet.id
  }
  resources {
    core_fraction = local.yandex.instance.core_fraction
    cores = local.yandex.instance.cores
    gpus = local.yandex.instance.gpus
    memory = local.yandex.instance.memory
  }
}
