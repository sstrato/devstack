#clear up virtualbox default gw
ip add flush eth0 
ip addr flush eth1
ip add flush br-ex


ovs-vsctl add-port br-ex eth1
ip link set br-ex up
ip addr add 10.1.1.203/24 dev br-ex
route del default gw 10.0.2.15
route add default gw 10.1.1.254 dev br-ex
