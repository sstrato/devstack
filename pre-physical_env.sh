#clear up virtualbox default gw
expected_args=1

if [ $# -ne $expected_args ]
then
		echo " usage: $0 revert/do "
		exit
fi

case $1 in
		revert )
				ip addr add 10.0.2.15/24 dev eth0     
				route add default gw 10.0.2.2 dev eth0  
				;;
		do )

				ifconfig eth0 down
				ip add flush eth0 
				ip addr flush eth1
				ip addr flush br-ex
				ovs-vsctl add-port br-ex eth1
				ip link set br-ex up
				ip addr add 10.1.1.204/24 dev br-ex
				route del default gw 10.0.2.15
				route add default gw 10.1.1.254 dev eth0
esac

