# This is the provider used to spin up the gcloud instance
provider "google" {
 
  project = "murthylab"
  credentials = file("terraform.json")
  region  = "us-central1"
  
}

resource "google_compute_instance" "vm-instance" {
  name         = "kalki-pipeline-tf"
  machine_type = "f1-micro"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20221018"
    }
  }
    
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}


