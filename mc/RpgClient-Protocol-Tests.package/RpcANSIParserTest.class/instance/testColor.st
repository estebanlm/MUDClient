tests
testColor
	|  parsed |

	parsed := self 
		parse: Character escape asString, '[0;37m'
		rule: #color.
		
	self assert: parsed class equals: RpcANSIColor.
	self deny: parsed isBold.
	self assert: parsed foregroundColor equals: (RpcANSIColor normalColorMapAt: 7).

	parsed := self 
		parse: Character escape asString, '[1;47m'
		rule: #color.
		
	self assert: parsed class equals: RpcANSIColor.
	self assert: parsed isBold.
	self assert: parsed backgroundColor equals: (RpcANSIColor brightColorMapAt: 7).
	
	parsed := self 
		parse: Character escape asString, '[1;31;42m'
		rule: #color.
		
	self assert: parsed class equals: RpcANSIColor.
	self assert: parsed isBold.
	self assert: parsed foregroundColor equals: (RpcANSIColor brightColorMapAt: 1).
	self assert: parsed backgroundColor equals: (RpcANSIColor brightColorMapAt: 2).
	
	parsed := self 
		parse: Character escape asString, '[0;44;33m'
		rule: #color.
		
	self assert: parsed class equals: RpcANSIColor.
	self deny: parsed isBold.
	self assert: parsed foregroundColor equals: (RpcANSIColor normalColorMapAt: 3).
	self assert: parsed backgroundColor equals: (RpcANSIColor normalColorMapAt: 4)