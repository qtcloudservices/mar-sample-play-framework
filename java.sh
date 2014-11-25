#!/bin/sh

export JAVA_OPTS='-Xmx256m'
./target/universal/stage/bin/mar-sample-play-framework -Dhttp.port=${PORT} 
