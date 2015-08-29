accessing
addPlugin: aPlugin
	aPlugin game: self.
	plugins := plugins copyWith: aPlugin