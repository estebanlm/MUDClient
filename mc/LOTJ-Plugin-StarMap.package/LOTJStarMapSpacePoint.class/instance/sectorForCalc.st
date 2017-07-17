accessing
sectorForCalc
	^ String streamContents: [ :stream | 
		stream 
			<< 'calc '''
			<< self sector x asString 
			<< ' ' 
			<< self sector y asString
			<< ''' 0 0 0' ]