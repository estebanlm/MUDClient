private ui
prepareDisplayAfterConnect
	self hardRefresh.
	self clearContents.
  	self window enable.
	self transmitFocus.
	self restorePlugins