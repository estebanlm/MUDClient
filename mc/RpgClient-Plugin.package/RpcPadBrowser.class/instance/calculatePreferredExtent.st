private
calculatePreferredExtent
	"65 is the 'base height': the height of the window without any pad.
	 28 is decomposed as is: 24 - pad, 2 + 2 insets"
	preferredExtent := self class preferredWidth@((28 * self plugin padCount) + 65).