Hack
====

* Install netselect from debian package.
  * http://packages.debian.org/stable/net/netselect

```
netselect -v -s10 -t20 `wget -q -O- https://launchpad.net/ubuntu/+archivemirrors | grep -P -B8 "statusUP|statusSIX" | grep -o -P "(f|ht)tp.*\"" | tr '"\n' '  '`
```

smaller is the best mirror of.

apt-get mirror trick
====================
use mirror://mirrors.ubuntu.com/mirrors.txt insted of specific mirror server.

```
deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse
```

for debian only
===============

```
# install netselect-apt
apt-get install netselect-apt
# just execute command
netselect-apt
```
