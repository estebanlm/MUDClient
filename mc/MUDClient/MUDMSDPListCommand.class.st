"
I ask for a list available. 
Usually: 

  ""COMMANDS""               Request an array of commands supported by the server.
  ""LISTS""                  Request an array of lists supported by the server.
  ""CONFIGURABLE_VARIABLES"" Request an array of variables the client can configure.
  ""REPORTABLE_VARIABLES""   Request an array of variables the server will report.
  ""REPORTED_VARIABLES""     Request an array of variables currently being reported.
  ""SENDABLE_VARIABLES""     Request an array of variables the server will send.

See class-side methods for implementation of this.
"
Class {
	#name : #MUDMSDPListCommand,
	#superclass : #MUDServerMSDPQueryCommand,
	#category : 'MUDClient-Model-ServerCommand'
}

{ #category : #private }
MUDMSDPListCommand >> commandName [
	^ 'LIST'
]
