workflow "Deploy documentation to GitHub Pages on push" {
  on = "push"
  resolves = ["deploy"]
}

# Filter for master branch
action "master branch only" {
  uses = "actions/bin/filter@master"
  args = "branch debug-website"
}

action "npm ci" {
  needs = "master branch only"
  uses = "docker://node:alpine"
  runs = "npm ci --production"
}

action "npm ci docs" {
  needs = "npm ci"
  uses = "docker://node:alpine"
  runs = "npm ci --production"
  env = {
    GITHUB_WORKSPACE = "/github/workspace/docs/"
  }
}

action "npm run build" {
  needs = "npm ci"
  uses = "docker://node:alpine"
  runs = "npm run build -- --prefix-paths"
  env = {
    GITHUB_WORKSPACE = "/github/workspace/docs/"
  }
}

action "deploy" {
  needs = "npm run build"
  uses = "maxheld83/ghpages@v0.2.1"
  env = {
    BUILD_DIR = "public/"
    GITHUB_WORKSPACE = "/github/workspace/docs/"
  }
  secrets = ["GH_PAT"]
}
