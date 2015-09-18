private ui
windowClosed: ann
	"A WindowClosed event has been received"
	super windowClosed: ann.
	self disconnect