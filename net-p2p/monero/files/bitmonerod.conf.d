# These options all come from bitmonerod --help
#
# I am no scripting genius so, all mandatory args
# are just arg=value.  Optional args have the actual
# argument to the daemon within the value and are disabled
# by emptying the string. Support for the test network is not
# available in this init script

# Where to store blockchain
data_dir="/var/lib/monero"

# Logging, disabled by default
log_file="/dev/null"
log_level=0

# It is usually pointless to enable commands to a background process
# Use empty string to disable
no_console="--no-console"

# Enforce DNS checkpoiting... whatever that is
# Use empty string to disable
enforce_dns_checkpointing="--enforce-dns-checkpointing"

# IP and port to bind the RPC server to
rpc_bind_ip="127.0.0.1"
rpc_bind_port=18081

# Bindings for p2p connections
p2p_bind_ip="0.0.0.0"
p2p_bind_port=18080

# External port for p2p if behind NAT
p2p_external_port=0

# Allow p2p connections from local ip
#allow_local_ip="--allow-local-ip"
allow_local_ip=""

# Manually add a peer to local list
#add_peer="--add-peer 192.168.1.1"
add_peer=""

# Attempt to stay connected to these peers 
#add_priority_node="--add-priority-node 192.168.1.1"
add_priority_node=""

# Connect only to these nodes
#add_exclusive_node="--add-exclusive-node 192.168.1.1"
add_exclusive_node=""

# Connect to this node, get addresses, disconnect
#seed_node="--seed-node 192.168.1.1"
seed_node=""

# Do not announce on peerlist
#hide_my_port="--hide-my-port"
hide_my_port=""

# Include text in this file for transaction comments
#extra_messages_file="--extra-messages-file /path/to/file"
extra_messages_file=""

# Also mine to specified address. Disabled by default
# start_mining="--start-mining address"
start_mining=""

# How many threads to dedicate to mining
#mining_threads="--mining-threads 1"
mining_threads=""

# All of these settings are for testing
# All correspond to their non-testing variables
# This isn't implemented in init.d/monero
#testnet=false
#testnet_data_dir="/var/lib/monero/testnet"
#testnet_rpc_bind_port=28081
#testnet_p2p_bind_port=28080
