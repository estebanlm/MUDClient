I'm a plugin to redirect parts of the terminal output to a  separated window.
Typically, this is to put out OOC, but it can be used also for other stuff.

We use regexp to define the filters, e.g.: 

^\(OOC\).* -> Will filter out all lines starting with (OOC)