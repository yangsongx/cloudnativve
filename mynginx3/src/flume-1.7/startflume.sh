#!/bin/bash

function check_env_withcurl()
{
    curl --connect-timeout 2 'http://172.32.200.30:19301/engine/'
    if [ $? -eq 0 ]; then
        env="prod"
    else
        curl --connect-timeout 2 'http://172.34.200.151:19301/engine/'
        if [ $? -eq 0 ]; then
            env="dev"
        else
            env="local"
        fi
    fi
    echo ${env}
}

function check_env()
{

    if [ ! -z $RUNNINGENV ]; then
        if [ $RUNNINGENV -eq 0 ]; then
            env="prod"
        elif [ $RUNNINGENV -eq 1 ]; then
            env="test"
        else
            env="dev"
        fi
    else
        env="dev"
    fi

    echo ${env}
}

function run_under_prod()
{
    /opt/proj/flume-1.7/bin/flume-ng agent -n a1 \
        -c /opt/project/flume-1.7/conf \
        -f /opt/project/flume-1.7/conf/nginx.conf
}

function run_under_dev()
{
    sed -i 's/a1.sinks.k1.hostname =.*/a1.sinks.k1.hostname = 172.34.200.100/' \
        /opt/project/flume-1.7/conf/nginx.conf
    /opt/project/flume-1.7/bin/flume-ng agent -n a1 \
        -c /opt/project/flume-1.7/conf \
        -f /opt/project/flume-1.7/conf/nginx.conf
}

function run_under_local()
{
    /opt/project/flume-1.7/bin/flume-ng agent -n agent \
        -c /opt/project/flume-1.7/conf \
        -f /opt/project/flume-1.7/conf/flume-conf.properties
}
##########################################################

echo "Starting nginx log collecter(flume)" 

# wait for the engine be ready
sleep 15

running_env="$(check_env)"
echo "now, the env is $running_env"

run_under_prod
