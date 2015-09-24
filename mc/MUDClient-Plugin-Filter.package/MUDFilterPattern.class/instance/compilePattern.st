private
compilePattern
	^ RxParser preferredMatcherClass
		for: (RxParser new parse: self pattern)
		ignoreCase: self isIgnoreCase