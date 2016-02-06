#!/bin/bash
set -e

if [ "$1" = 'logstash-input-zendesk' ]
then
    cd /usr/src/app
    bundle install
    bundle exec rake vendor
    gem build logstash-input-zendesk.gemspec
    if mountpoint -q /target
    then
        echo "Installing logstash-input-zendesk to /target"
        cp *.gem /target
    else
        echo "/target is not a mountpoint."
        echo "You can either:"
        echo "- re-run this container with -v <some dir>:/target"
        echo "- extract the logstash-input-zendesk-<version>.gem (located at /usr/src/app)"
    fi
else
  exec "$@"
fi
