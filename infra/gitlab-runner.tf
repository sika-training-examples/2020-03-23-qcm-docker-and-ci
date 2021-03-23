resource "digitalocean_droplet" "runner" {
  image  = "docker-18-04"
  name   = "qcm-runner"
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

resource "cloudflare_record" "runner" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "runner.qcm"
  value   = digitalocean_droplet.runner.ipv4_address
  type    = "A"
  proxied = false
}

output "runner" {
  value = {
    ip   = digitalocean_droplet.runner.ipv4_address
    fqdn = cloudflare_record.runner.hostname
  }
}
