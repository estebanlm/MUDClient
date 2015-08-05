private
resetCommandBindings
	commands withIndexDo: [ :each :index | each keyBinding: (self keyBindingFor: index) ]