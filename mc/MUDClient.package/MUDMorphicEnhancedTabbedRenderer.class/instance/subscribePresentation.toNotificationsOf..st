rendering
subscribePresentation: aPresentation toNotificationsOf: tab 
	| activePresentation |
	
	tabs announcer when: LazyTabPageChanged do: [ :ann | 
		activePresentation := aPresentation matchingPresentations at: ann pageIndex.
		aPresentation parentPrototype announcer 
			announce: (MUDPresentationActivated new 
				presentation: activePresentation;
				yourself).				
		aPresentation announcer suspendAllWhile: [ 
			aPresentation pane lastActivePresentation: activePresentation ]].
