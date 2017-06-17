I'm an abstract command to send to the server.
Commands can be sent for all resons you want. In general to ask things. 

So, commands can wait for an answer: 
- waitForAnswer needs to return true
- you need to declare a block to handle returning value

Tipically, I can be used by subclassing me, in which case you will need to extend some methods: 

- #buildCommand, where you will actually build your command.
- #isProcessingProtocol: where you answer if this command is appropriate for certain protocol (an example is implemented with MSDP)
