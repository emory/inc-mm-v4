# 2018-03-02 10:49:08 java issues and s3_website

using `jenv`:

- brew install jenv
- mkdir -p ~/.jenv/versions

install jdk 8u162-macosx-x64.dmg

add that jdk to jenv:

`jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home`

view all versions

`jenv versions`

probably will list as oracle64-1.8.whatever

use global:

`jenv global oracle64-1.8.0.162`

uninstall jdk9 via homebrew et al?

then java -version reports the right one, and `s3_website push` will work
