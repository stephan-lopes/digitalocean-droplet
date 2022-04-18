resource "digitalocean_droplet" "_" {
  name   = "terraform-test-droplet"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-18-04-x64"
  region = "nyc3"
}

resource "digitalocean_floating_ip" "_" {
  droplet_id = digitalocean_droplet._.id
  region = digitalocean_droplet._.region
}

