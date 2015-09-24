rendering
subscribePresentationToContextNotifications: aPresentation
	aPresentation when: GLMContextChanged send: #actOnContextChanged: to: self.
	aPresentation when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	aPresentation when: GLMPresentationToolbarUpdated send: #actOnPresentationToolbarUpdated: to: self