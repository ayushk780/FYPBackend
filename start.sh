#!/bin/sh
apt-get update
export DEBIAN_FRONTEND=noninteractive
apt-get -y install tzdata
echo "Asia/Kolkata" | tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata
apt-get install -y openjdk-8-jdk
java -server -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:InitialRAMFraction=2 -XX:MinRAMFraction=2 -XX:MaxRAMFraction=2 -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:+UseStringDeduplication -jar demo.jar
