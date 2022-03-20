> logfile
exec > logfile 2>&1

./luau/luau-analyze build.lua

if grep -q "SyntaxError" <<< $(<logfile); then
	echo "syntax error found! aborting!"
	exit 1 # bad
fi

exit 0 # good
