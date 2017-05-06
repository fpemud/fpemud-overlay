#!/sbin/runscript
# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

description="Monero anonymous cryptocoin rpc and p2p server daemon"

command="/usr/bin/bitmonerod"

command_args="--data-dir ${data_dir} \
--rpc-bind-ip ${rpc_bind_ip} \
--rpc-bind-port ${rpc_bind_port} \
--p2p-bind-ip ${p2p_bind_ip} \
--p2p-bind-port ${p2p_bind_port} \
--p2p-external-port ${p2p_external_port} \
--log-file ${log_file} \
--log-level ${log_level} \
${no_console} \
${enfore_dns_checkpointing} \
${allow_local_ip} \
${add_peer} \
${add_priority_node} \
${add_exclusive_node} \
${seed_node} \
${hide_my_port} \
${extra_messages_file} \
${start_mining} \
${mining_threads}"


user="monero"
group="monero"
pid="/var/run/monero/bitmonerod.pid"

depend() {
	need net
	use dns
}

start() {
	ebegin "Starting Monero daemon"
	checkpath -d -m 0755 -o monero:monero /var/run/monero
	start-stop-daemon --start --background --quiet --exec "${command}" \
	--user ${user} --group ${group}  --pidfile ${pid} --make-pidfile \
	-- ${command_args}
	eend $?
}

stop() {
	ebegin "Stopping Monero daemon"
	start-stop-daemon --stop --exec "${command}" --quiet --user ${user} \
	--pidfile ${pid} --group ${group}
	eend $?
}
