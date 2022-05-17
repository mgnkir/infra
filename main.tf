terraform {
  required_providers {
    yandex		= {
      source							= "yandex-cloud/yandex"
	}
	}
}

provider "yandex" {
	token	= var.yandex-token
	cloud_id = local.yandex.cloud_id
	folder_id	= "https://console.cloud.yandex.ru/folders/${local.yandex.folder_id}"
  zone         	= local.yandex.zone
}
