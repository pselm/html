#! /bin/sh

pulp browserify -m Examples.HelloWorld -t build/HelloWorld.js -I examples -j 4 --optimise
pulp browserify -m Examples.UnorderedList -t build/UnorderedList.js -I examples -j 4 --optimise
pulp browserify -m Examples.Buttons -t build/Buttons.js -I examples -j 4 --optimise
pulp browserify -m Examples.Field -t build/Field.js -I examples -j 4 --optimise
pulp browserify -m Examples.Form -t build/Form.js -I examples -j 4 --optimise
pulp browserify -m Examples.Random -t build/Random.js -I examples -j 4 --optimise
