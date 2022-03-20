ls


chmod +x ../build.lua

for FILE in ../modules/*; do
	echo $FILE;
	chmod +x $FILE
	CONTENTS=`cat $FILE`
	> ../build.lua
	echo $CONTENTS >> ../build.lua -- imported from ../$FILE
done


echo `cat ../main.lua` >> ../build.lua
