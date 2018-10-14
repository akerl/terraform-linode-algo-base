resource "linode_instance" "algo" {
  label = "${var.name}-algo"

  region = "${var.region}"
  type   = "${var.type}"

  disk {
    label           = "root"
    size            = 10240
    authorized_keys = "${var.ssh_keys}"
    image           = "${var.source_image_id}"
  }

  config {
    label  = "default"
    kernel = "linode/grub2"

    devices {
      sda = {
        disk_label = "root"
      }
    }
  }

  provisioner "remote-exec" {
    script = "${path.module}/assets/system_init.sh"
  }
}
