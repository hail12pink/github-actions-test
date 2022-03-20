# github-actions-test

## how do it work!?

the workflow ([/.github/workflows/onPush.yml](https://github.com/hail12pink/waste-of-space-autobuild/blob/main/.github/workflows/onPush.yml)) runs the [/build.sh](https://github.com/hail12pink/waste-of-space-autobuild/blob/main/build.sh) shell script whenever a push is made to the repository.


the build.sh script will first add all of the [modules](https://github.com/hail12pink/waste-of-space-autobuild/tree/main/modules) to a file called [/build.lua](https://github.com/hail12pink/waste-of-space-autobuild/blob/main/build.lua)

next, the build.sh script places the code from [/main.lua](https://github.com/hail12pink/waste-of-space-autobuild/blob/main/main.lua) at the end of build.lua

after build.sh is done, the workflow will run the the [/syntaxChecker.sh](https://github.com/hail12pink/waste-of-space-autobuild/blob/main/syntaxChecker.sh) shell script.

this script will run /luau/luau-analyze, and if it sees any syntax errors it will error and stop the workflow. this is to ensure no files built with syntax errors are pushed to the repository

if there are no syntax errors, then build.lua will be push! yay!
