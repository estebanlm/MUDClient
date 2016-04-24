actions
export
	(self name asFileReference withExtension: 'ston') 
		writeStreamDo: [ :stream | STON put: self onStreamPretty: stream ]
		