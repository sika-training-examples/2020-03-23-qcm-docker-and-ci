resource "cloudflare_record" "prod_hello" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019"
  name    = "qcm-hello"
  value   = cloudflare_record.prod.hostname
  type    = "CNAME"
  proxied = true
}
