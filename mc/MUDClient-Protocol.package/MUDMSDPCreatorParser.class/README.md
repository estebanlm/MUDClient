I'm a parser to create valid MSDP commands. 
Using me, you can write commands like this: 

ESC IAC SB MSDP MSDP_VAR "SEND" MSDP_VAL "HEALTH" IAC SE

and obtain the corresponding ByteArray representation. 

You can see

 http://tintin.sourceforge.net/msdp/ 

for more details about the MSDP protocol.