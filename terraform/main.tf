module "database" {
    source = "./src/database"
}

module "app" {
    source = "./src/app"
}

module "website" {
    endpoint = module.app.url
    source = "./src/website"
}