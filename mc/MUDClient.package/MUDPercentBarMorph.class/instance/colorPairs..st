accessing
colorPairs: aCollectionOfPairs 
	"A list of colors and percents. See defaults for example"
	^ colorPairs ifNil: [ colorPairs := self class defaultColorPairs ].