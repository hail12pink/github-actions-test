chmod +x build.lua
> build.lua # we clear build.lua

for FILE in modules/*; do
	echo $FILE;
	chmod +x $FILE
	echo "$(<$FILE)" >> build.lua -- imported from ../$FILE # insert the module code into the build.lua file
done

echo "$(<main.lua)" >> build.lua # insert the main code into the build.lua file

git init
git config --global user.name "robot"
git config --global user.email = "robot@gmail.com"
git commit build.lua -m "compiled build.lua"
