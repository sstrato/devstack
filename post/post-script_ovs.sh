#! /usr/bin/env bash

quantum net-create private-net-01 --provider:network_type flat --provider:physical_network private-net-01 --shared
quantum subnet-create private-net-01 172.27.0.0/24 --name private-subnet-01
quantum subnet-update private-subnet-01 --dns_nameservers list=true 8.8.8.8
quantum router-create private-net-01-router
quantum router-interface-add private-net-01-router private-subnet-01
quantum net-create floating-net --router:external=True
quantum subnet-create floating-net 172.16.0.100/32
quantum subnet-create floating-net 172.16.0.101/32
quantum subnet-create floating-net 172.16.0.102/32
quantum subnet-create floating-net 172.16.0.103/32
quantum subnet-create floating-net 172.16.0.104/32
quantum router-gateway-set private-net-01-router floating-net
