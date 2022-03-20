chmod +x build.lua
> build.lua #clear build.lua

for FILE in modules/*; do
	echo $FILE;
	chmod +x $FILE
	CONTENTS=`cat $FILE`
	echo $CONTENTS >> build.lua -- imported from ../$FILE
done


echo `cat main.lua` >> build.lua

git init
git config --global user.name "robot"
git config --global user.email = "robot@gmail.com"
git commit build.lua -m "compiled build.lua"
