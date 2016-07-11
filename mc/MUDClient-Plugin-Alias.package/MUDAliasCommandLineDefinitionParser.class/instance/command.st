grammar
command
	^ complexCommand / basicCommand
		==> [ :nodes | MUDAliasCommand keywords: nodes ]