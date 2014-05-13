grammar
reset
	^ (csi, '0m' asParser)
		==> [ :nodes | RpcANSIReset new ]