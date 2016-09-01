private ui
repopulateToolbar: aToolbar
	aToolbar removeAll.
	aToolbar
		add: ((GtkToolButton newForm: #connect asMUDIcon label: 'Connect')
			tooltipText: 'Connect';
			connectClicked: [ self doConnect ]);
		add: ((GtkToolButton newForm: #reconnect asMUDIcon label: 'Reconnect')	
			tooltipText: 'Reconnect';
			sensitive: self hasPreviousGame;
			connectClicked: [ self doReconnect ]);
		add: ((GtkToolButton newForm: #disconnect asMUDIcon label: 'Disconnect')
			tooltipText: 'Disconnect';
			sensitive: self isConnected;
			connectClicked: [ self doDisconnect ]);
		add: ((GtkToolButton newForm: #configure asMUDIcon label: 'Configure')
			tooltipText: 'Configure';
			connectClicked: [ self doConfigure ]).
	
	self isConnected ifFalse: [ ^ self ].
	
	aToolbar
		add: GtkSeparatorToolItem new;
		addAll: (	MUDPluginSpec allSpecs 
				select: #hasToolbarSpec 
				thenCollect: [ :each | | spec | 
					spec := each toolbarSpec.
					(GtkToolButton newForm: spec icon label: spec title)
						tooltipText: spec title;
						connectClicked: [ spec action cull: self cull: self game ];
						yourself ]).