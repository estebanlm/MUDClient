accessing
directory
	^ (RpcSessionLog baseDirectory / self game name) ensureCreateDirectory	
