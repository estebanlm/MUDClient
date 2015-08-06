grammar
clear
	^ (csi, ps, 'J' asParser)
		==> [ :nodes | RpcANSIClear value: nodes second asNumber ]