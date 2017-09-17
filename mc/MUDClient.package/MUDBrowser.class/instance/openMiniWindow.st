showing
openMiniWindow
	"Creates and open window"
	self startOn: self startValue.
	self basicOpen: (TkPlatform current renderMiniBrowser: self)