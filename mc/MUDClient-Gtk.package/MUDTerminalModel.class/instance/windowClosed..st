private ui
windowClosed: ann
	"A WindowClosed event has been received"
	self disconnect.
	window := nil "destroy window"