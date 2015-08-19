private
createFileName
	| date |
	date := DateAndTime now.
	^ 'log-{1}-{2}-{3}.txt' format: { date year. date month. date dayOfMonth } 