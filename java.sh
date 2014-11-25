#!/bin/sh

export JAVA_OPTS='-Xmx256m'
./target/universal/tmp/bin/mar-sample-play-framework -Dhttp.port=${PORT} 
