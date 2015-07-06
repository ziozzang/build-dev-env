#!/bin/bash

exit 0

# Setup Gerrit

# docker create --name=gerrit --restart=always  -v /etc/localtime:/etc/localtime:ro  -v /srv/gerrit:/var/gerrit/review_site openfrontier/gerrit
docker create --name=gerrit --restart=always  openfrontier/gerrit
docker start gerrit


# Setup Gitlab
