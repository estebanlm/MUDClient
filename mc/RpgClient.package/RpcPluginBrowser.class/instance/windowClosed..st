private
windowClosed: ann
	super windowClosed: ann.
	self owner removeDependentWindow: self.
	self owner announce: RpcRefreshKeyBindingsAnnouncement new