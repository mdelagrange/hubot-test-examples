set -ex

export PATH=`pwd`/node_modules/.bin:$PATH
npm install yo generator-hubot

yo hubot --name="Hubot" --defaults
