resource "google_compute_instance" "vm_instance" {
  name         = "project2-infra-vm"
  machine_type = "e2-micro" # This is the "Always Free" instance type
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # This gives the VM a public IP
    }
  }

  # Firewall rule to allow HTTP traffic
  tags = ["http-server"]

  metadata_startup_script = "sudo apt-get update && sudo apt-get install -y docker.io"
}

resource "google_compute_firewall" "default_allow_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

output "instance_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}