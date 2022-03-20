# github-actions-test

## how do it work!?

you put da modules in [/modules](https://github.com/hail12pink/github-actions-test/tree/main/modules)

then da workflow in [/.github/workflows/onPush.yml](https://github.com/hail12pink/github-actions-test/blob/main/.github/workflows/onPush.yml) runs da crazy [/build.sh](https://github.com/hail12pink/github-actions-test/blob/main/build.sh)


the crazy build.sh shell script puts all the code from other modules into da epic [/build.lua](https://github.com/hail12pink/github-actions-test/blob/main/build.lua)

and then puts [/main.lua](https://github.com/hail12pink/github-actions-test/blob/main/main.lua) at the end of [/build.lua](https://github.com/hail12pink/github-actions-test/blob/main/build.lua)!!!

the end!

