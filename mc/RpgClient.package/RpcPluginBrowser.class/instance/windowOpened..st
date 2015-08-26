private
windowOpened: ann
	super windowOpened: ann.
	self owner announce: RpcRefreshKeyBindingsAnnouncement new