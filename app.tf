provider "heroku" {
    email = "email"
    api_key = "apikey"
}

resource "heroku_app" "default" {
    name = "heroku_unique_app_name"
    region = "us"
    stack = "ruby"
}

resource "heroku_addon" "database" {
  app = "${heroku_app.default.name}"
  plan = "heroku-postgresql:hobby-basic"
}

