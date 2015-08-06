actions
refreshKeyBindings
	"Should take console and reset keyBindings"
	| category |
	
	category := KMCategory named: 'RPC-KEY-BINDINGS'.
	self activeDisplayConfiguration installKeyBindingsOn: category.
	self console 
		replaceKeyBindings: category name 
		with: category.