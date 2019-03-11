#!/bin/sh
watchman watch-del-all
rm -r ./node_modules && npm install
# rm -rf /tmp/metro-cache
npm start -- --reset-cache
rm -rf /tmp/haste-map-metro-*
