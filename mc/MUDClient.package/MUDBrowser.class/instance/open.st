showing
open
	"Creates and open window"
	self startOn: self startValue.
	self basicOpen: (TkPlatform current renderBrowser: self)