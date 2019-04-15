FROM node:10

LABEL "com.github.actions.name"="Prepare deploy of website"
LABEL "com.github.actions.description"="Installs all required dependencies and builds static website"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="gray-dark"
LABEL "repository"="http://github.com/octokit/rest.js"
LABEL "homepage"="http://octokit.github.io/rest.js"
LABEL "maintainer"="Gregor Martynus (https://github.com/gr2m)"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# # install
# # COPY ../../package*.json ./
# RUN npm ci --only=production

# # COPY ../../docs ./
# RUN npm --prefix ./docs install ./docs

# # build
# ENTRYPOINT [ "npm", "run", "build", "--prefix ./docs ]
