private ui
prepareDisplayAfterConnect
	"self hardRefresh."
	self clearContents.
  	self window sensitive: true.
	self transmitFocus.
	self restorePlugins