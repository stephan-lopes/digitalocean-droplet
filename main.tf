resource "digitalocean_droplet" "_" {
  name   = "terraform-test-droplet"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-18-04-x64"
  region = "nyc3"
}

resource "digitalocean_floating_ip" "_" {
  droplet_id = digitalocean_droplet._.id
  region     = digitalocean_droplet._.region
}

resource "digitalocean_firewall" "_" {
  name        = "terraform-test-firewall"
  droplet_ids = [digitalocean_droplet._.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["8.8.8.8/32"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["8.8.8.8/32"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["8.8.8.8/32"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["8.8.8.8/32"]
  }

}