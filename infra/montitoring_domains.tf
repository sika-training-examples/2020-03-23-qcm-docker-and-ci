resource "cloudflare_record" "prom" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "prom"
  value   = cloudflare_record.prod.hostname
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "am" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "am"
  value   = cloudflare_record.prod.hostname
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "gr" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "gr"
  value   = cloudflare_record.prod.hostname
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "mail" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "mail"
  value   = cloudflare_record.prod.hostname
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "bb" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "bb"
  value   = cloudflare_record.prod.hostname
  type    = "CNAME"
  proxied = true
}
