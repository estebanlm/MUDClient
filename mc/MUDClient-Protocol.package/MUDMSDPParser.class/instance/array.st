accessing
array
	^ arrayOpen, (val, string) star, arrayClose
		==> [ :nodes | nodes second collect: #second ]