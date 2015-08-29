grammar
reset
	^ (csi, '0m' asParser)
		==> [ :nodes | MUDANSIReset new ]