showing
hardRefresh
	"This is a hard refresh... it forces a re-calculation of all contents.
	 Ideally is not really used, but there are certain cases where I need to re-think everything. 
	 Look for senders to understand its uses"
	self clear.
	self buildContentsOn: self. 
	self startOn: self startValue.
	self refresh