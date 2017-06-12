private
serverCommandReceivers
	"Command receivers are commands sent to the server that will wait for 
	 an answer (like doing a query to the server). 
	 See MUDMSDPAskValue as an example"
	^ serverCommandReceivers ifNil: [ serverCommandReceivers := OrderedCollection new ]