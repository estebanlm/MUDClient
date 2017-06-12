private
runner
	^ TaskRunner ifNil: [ TaskRunner := TKTNewProcessTaskRunner new ]