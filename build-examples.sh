#! /bin/sh

pulp browserify -m Examples.HelloWorld -t build/HelloWorld.js -I examples -j 4 --optimise
