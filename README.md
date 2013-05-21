DevStack NG model Implementation

3 node deploy example. You can add more compute nodes if you want.

1. git clone https://github.com/hyunsun/devstack.git -b stable/grizzly
2. change localrc-controller, localrc-network, localrc-compute to "localrc" accordingly
3. open localrc and change host IP addresses properly
4. run stack.sh on controller node first
5. after controller done, run post-script.sh on conroller
6. run stack.sh on network node, compute node 
