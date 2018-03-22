#!/bin/bash

NC='\033[0m'      # Normal Color
RED='\033[0;31m'  # Error Color
CYAN='\033[0;36m' # Info Color

___this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


etc_devops_dir="$(dirname $___this_dir)"

if [ -t 1 ] ; then 
    docker_run_fg_mode='-it'
else 
    docker_run_fg_mode='-i'
fi

function run_cmd() {
    local t=`date`
    echo "$1"
    eval $1
}

function ensure_dir() {
    if [ ! -d $1 ]; then
        run_cmd "mkdir -p $1"
    fi
}

function ensure_dir_for_file() {
    ensure_dir $(dirname $1)
}

function container_is_running() {
    local container_name=$1
    local num=$(docker ps -a -f name="^/$container_name$" -q | wc -l)
    if [ "$num" == "1" ]; then
        local ret=$(docker inspect -f {{.State.Running}} $1)
        echo $ret
    else
        echo 'false'
    fi
}

function stop_container() {
    local container_name=$1
    local cmd="docker ps -a -f name='^/$container_name$' | grep '$container_name' | awk '{print \$1}' | xargs -I {} docker rm -f --volumes {}"
    run_cmd "$cmd"
}

function docker0_ip() {
    echo $(get_interface_ip docker0)
}

function get_interface_ip() {
    local interface=$1
    local host_ip=$(ip addr show $interface | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | awk '{print $1}' | head  -1)
    echo $host_ip
}

function read_kv_config() {
    local file=$1
    local key=$2
    cat $file | grep "$key=" | awk -F '=' '{print $2}'
}

function os_name() {
    local uname_out="$(uname -s)"
    local machine=''
    case "${uname_out}" in
        Linux*)     machine=linux;;
        Darwin*)    machine=mac;;
        CYGWIN*)    machine=cygwin;;
        MINGW*)     machine=MinGw;;
        *)          machine="unknown:${uname_out}"
    esac
    echo $machine
}

function base_docker_args() {
    local os_name=$(os_name)
    local _env=$1
    local _container_name=$2
    local _hostname=$(hostname)
    local args="$args --name $_container_name"
    args="$args -h $_container_name@$_hostname"
    args="$args -e PUPPY_ENV=$_env"
    args="$args -e PUPPY_CONTAINER_NAME=$_container_name"
    args="$args -e PUPPY_HOSTNAME=$_hostname"
    if [ "$os_name" != 'mac' ]; then
        args="$args -v /etc/localtime:/etc/localtime"
    fi
    if [ -d '/etc/devops' ]; then
        args="$args -v /etc/devops/:/etc/devops/:ro"
    fi
    echo $args
}

action=${1:-help}
