private
prepareDisplayAfterConnect
	window ifNil: [ ^ self ]. "No display"
  	window enable.
	self clearContents.
	self transmitFocus.
