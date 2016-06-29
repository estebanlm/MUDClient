scripting
do: aBlock whileAnyOf: whileCollection untilAnyOf: untilCollection 
	do := aBlock.
	while := whileCollection.
	until := untilCollection.
	self waiting.
	do value. "Execute first time"
	