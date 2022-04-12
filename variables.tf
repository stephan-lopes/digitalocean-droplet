variable "digitalocean_token" {
  nullable  = false
  sensitive = true

  description = "DigitalOcean API token"
  type        = string

  validation {
    condition     = can(regex("^dop_v1_[0-9a-f].+", var.digitalocean_token))
    error_message = "ERROR! DigitalOcean API token is invalid format."
  }
}