actions
resetKeyBindings
	"Should take console and reset keyBindings"
	| category |
	category := RpcDynamicKeyMappingCategory named: self activeGame name.
	self activeDisplayConfiguration installKeyBindingsOn: category.
	self console replaceKeyBindingsWith: category.