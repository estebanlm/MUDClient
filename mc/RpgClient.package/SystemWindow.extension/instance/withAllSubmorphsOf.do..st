*RpgClient
withAllSubmorphsOf: aMorph do: aBlock
	aMorph submorphs do: [ :each |
		aBlock value: each.
		self withAllSubmorphsOf: each do: aBlock ]