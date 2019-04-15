#!/bin/sh -l

npm install @octokit/routes # installs version defined in /package.json
npm --prefix ./docs install ./docs
npm run build --prefix ./docs -- --prefix-paths
