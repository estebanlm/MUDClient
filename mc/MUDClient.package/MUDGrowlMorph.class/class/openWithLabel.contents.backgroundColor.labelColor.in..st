instance creation
openWithLabel: aString contents: contentString backgroundColor: aColor labelColor: aLabelColor in: aMorph
	^ (self label: aString contents: contentString)
			backgroundColor: aColor;
			labelColor: aLabelColor;
			contentsColor: aLabelColor; 
			openOn: aMorph