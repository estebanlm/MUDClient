private
windowOpened: ann
	super windowOpened: ann.
	self owner announce: MUDRefreshKeyBindingsAnnouncement new