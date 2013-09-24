#! /usr/bin/env bash


source openrc admin admin
quantum net-create multihost-net-01 --multihost:multi_host --provider:network_type flat --provider:physical_network multihost-net-01 --shared
NET_ID=$(quantum net-list | grep multihost-net-01 | get_field 1)
quantum router-create multihost-router-01 --multihost:network_id $NET_ID
quantum subnet-create multihost-net-01 172.27.0.0/24 --name multihost-subnet-01
quantum subnet-update multihost-subnet-01 --dns_nameservers list=true 8.8.8.8
quantum router-interface-add multihost-router-01 multihost-subnet-01
quantum net-create floating-net --router:external=True
#quantum subnet-create floating-net 192.168.1.0/24 --name floating-subnet --gateway 192.168.1.254 --allocation-pool start=192.168.1.100,end=192.168.1.150 --disable-dhcp
quantum subnet-create floating-net 10.1.1.100/32
quantum subnet-create floating-net 10.1.1.101/32
quantum subnet-create floating-net 10.1.1.102/32
quantum subnet-create floating-net 10.1.1.103/32
quantum subnet-create floating-net 10.1.1.104/32
quantum router-gateway-set multihost-router-01 floating-net
