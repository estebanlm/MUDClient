grammar
clear
	^ (csi, ps, 'J' asParser)
		==> [ :nodes | MUDANSIClear value: nodes second asNumber ]