#!/bin/sh -l

npm ci --only=production
npm --prefix ./docs install ./docs
npm run build --prefix ./docs -- --prefix-paths
