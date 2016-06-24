descriptions
descriptionPlugins
	<magritteDescription>
	| currentSpecs |

	currentSpecs := self plugins 
		select: [ :each | each spec needsExplicitActivation ]
		thenCollect: #spec.
	^ MAMultipleOptionDescription new 
		priority: 35;
		label: 'Activate plugins';
		options: MUDPluginSpec allExplicitActivationSpecs;
		reference: (MAStringDescription new accessor: #name; asContainer);
		morphClass: TkMultiSelectFastListMorph;
		accessor: (MAPluggableAccessor 
			read: [ :this | currentSpecs ]
			write: [ :this :value | 
				"remove"
				(currentSpecs \ value) do: [ :each | self removePlugin: (each pluginAt: this) ].
				"now add"
				(value \ currentSpecs) do: [ :each | each pluginAt: this] ]);
		tkRowsToShow: 4;
		tkHideAdd;
		tkRemoveIcon: #delete asMUDIcon;
		tkRemoveHelpText: 'Remove {1}' localised;
		tkPickIcon: #find asMUDIcon;
		tkPickAcceptIcon: #ok asMUDIcon;
		tkPickCancelIcon: #cancel asMUDIcon;
		tkListingDescription: #name;
		yourself