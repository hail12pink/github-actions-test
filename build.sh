chmod +x build.lua

for FILE in modules/*; do
	echo $FILE;
	chmod +x $FILE
	CONTENTS=`cat $FILE`
	> build.lua
	echo $CONTENTS >> build.lua -- imported from ../$FILE
done


echo `cat main.lua` >> build.lua

git init
git config --global user.name "robot"
git config --global user.email = "robot@gmail.com"
git commit -a -m "compiled build.lua"
