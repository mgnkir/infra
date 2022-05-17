locals {
  yandex = {
    zone = "ru-central1-c"
    folder_id = "b1g70f77p06273c2daor"
    cloud_id = "b1gi89rl3nu8hp9q2v0u"
    instance = {
      private_cidr = ["10.110.0.0/24"]
      admin = "devops"
      platform_id = "standard-v2"
      core_fraction = 5
      cores = 2
      gpus = 0
      memory = 0.5
    }
    hdd	= {
      image_id = "fd8t3akk0neg8s7ub31q"
      size  = 5
      type = "network-hdd"
   }
  }
}
