#! /bin/sh

pulp browserify -m Examples.HelloWorld -t build/HelloWorld.js -I examples -j 4 --optimise
pulp browserify -m Examples.UnorderedList -t build/UnorderedList.js -I examples -j 4 --optimise
pulp browserify -m Examples.Buttons -t build/Buttons.js -I examples -j 4 --optimise
