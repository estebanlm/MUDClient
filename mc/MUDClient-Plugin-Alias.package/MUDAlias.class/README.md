I'm an alias for MUD Client. 
I define a transformation of the input to be sent to the game server as real input. 
I accept wildcards... my input can be: 

myalias :* 
myalias :arg1 to :arg2

and it can be mapped to: 

real-command :*
or 
real-command1 :arg1
real-command2 :arg1 to: arg2