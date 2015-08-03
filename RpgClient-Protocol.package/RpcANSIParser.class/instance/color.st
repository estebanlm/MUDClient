grammar
color
	^ csi, (ps, ';' asParser) star, ps, 'm' asParser
		==> [ :nodes | | colors |
			colors := nodes second 
				ifNotEmpty: [ :v | v collect: [ :each | each first asNumber ] ]
				ifEmpty: [ #() ].
			colors :=  colors copyWith: nodes third asNumber.
			RpcANSIColor value: colors ]