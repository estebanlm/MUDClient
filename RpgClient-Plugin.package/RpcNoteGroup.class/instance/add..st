accessing
add: aNoteOrGroup
	aNoteOrGroup parent: self.
	children := children copyWith: aNoteOrGroup