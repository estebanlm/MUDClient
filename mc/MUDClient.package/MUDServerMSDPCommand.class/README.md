I'm an abstract command to server for MSDP protocol. 
I define the proper protocol and build the command. 
Since I'm for querying variables to server, I also override #waitForAnswer.

My children implement the concrete commands to send, by overriding #commandName.