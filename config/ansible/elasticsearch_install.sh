#!/bin/bash
set -e

wget -O /tmp/elasticsearch-2.3.5.deb https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.5/elasticsearch-2.3.5.deb
dpkg -i /tmp/elasticsearch-2.3.5.deb

