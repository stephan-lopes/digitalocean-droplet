resource "digitalocean_droplet" "_" {
  name   = "terraform-test-droplet"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-18-04-x64"
  region = "nyc3"
}
