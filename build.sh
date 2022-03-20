chmod +x build.lua
> build.lua #we clear build.lua

for FILE in modules/*; do
	echo $FILE;
	chmod +x $FILE
	CONTENTS=`$(<FILE)`
	$CONTENTS >> build.lua -- imported from ../$FILE
done

`$(<main.lua)` >> build.lua

git init
git config --global user.name "robot"
git config --global user.email = "robot@gmail.com"
git commit build.lua -m "compiled build.lua"
