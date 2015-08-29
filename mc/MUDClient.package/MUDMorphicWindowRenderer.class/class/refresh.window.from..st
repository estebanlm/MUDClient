instance creation
refresh: aPresentation window: aWindow from: aRenderer 
	^ self new 
		renderer: aRenderer;
		window: aWindow;
		refresh: aPresentation