#! /usr/bin/env bash
 
source openrc admin admin
quantum net-create multihost-net-01 --multihost:multi_host --shared
NET_ID=$(quantum net-list | grep private-net-01 | get_field 1)
quantum subnet-create multihost-net-01 172.27.4.0/22 --name multihost-subnet-01
quantum subnet-update multihost-subnet-01 --dns_nameservers list=true 8.8.8.8
