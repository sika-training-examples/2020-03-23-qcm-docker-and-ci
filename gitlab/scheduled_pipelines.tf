resource "gitlab_pipeline_schedule" "nightly-no-cache" {
   project     = var.project_id
   description = "[nightly] no cache build"
   ref         = "master"
   cron        = "0 0 * * *"
}

resource "gitlab_pipeline_schedule_variable" "nightly-no-cache-BUILD_NO_CACHE" {
  project              = var.project_id
  pipeline_schedule_id = gitlab_pipeline_schedule.nightly-no-cache.id
  key                  = "BUILD_NO_CACHE"
  value                = "1"
}
