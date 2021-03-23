variable "do_token" {}
variable "cloudflare_api_token" {}

provider "digitalocean" {
  token = var.do_token
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}


data "digitalocean_ssh_key" "ondrejsika" {
  name = "ondrejsika"
}

resource "digitalocean_droplet" "dev" {
  image  = "docker-18-04"
  name   = "qcm-dev"
  region = "fra1"
  size   = "s-2vcpu-4gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika.id
  ]
  user_data = <<-EOF
  #cloud-config
  ssh_pwauth: yes
  password: asdfasdf2021
  chpasswd:
    expire: false
  runcmd:
    - ufw disable
  EOF
}

resource "cloudflare_record" "dev" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "dev.qcm"
  value   = digitalocean_droplet.dev.ipv4_address
  type    = "A"
  proxied = false
}


resource "cloudflare_record" "dev_wildcard" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "*.${cloudflare_record.dev.name}"
  value   = cloudflare_record.dev.hostname
  type    = "CNAME"
  proxied = false
}

resource "digitalocean_droplet" "prod" {
  image  = "docker-18-04"
  name   = "qcm-prod"
  region = "fra1"
  size   = "s-2vcpu-4gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika.id
  ]
  user_data = <<-EOF
  #cloud-config
  ssh_pwauth: yes
  password: asdfasdf2021
  chpasswd:
    expire: false
  runcmd:
    - ufw disable
  EOF
}

resource "cloudflare_record" "prod" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "prod.qcm"
  value   = digitalocean_droplet.prod.ipv4_address
  type    = "A"
  proxied = false
}


resource "cloudflare_record" "prod_wildcard" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "*.${cloudflare_record.prod.name}"
  value   = cloudflare_record.prod.hostname
  type    = "CNAME"
  proxied = false
}


output "dev" {
  value = {
    ip            = digitalocean_droplet.dev.ipv4_address
    fqdn          = cloudflare_record.dev.hostname
    fqdn_wildcard = cloudflare_record.dev_wildcard.hostname
  }
}

output "prod" {
  value = {
    ip            = digitalocean_droplet.prod.ipv4_address
    fqdn          = cloudflare_record.prod.hostname
    fqdn_wildcard = cloudflare_record.prod_wildcard.hostname
  }
}
