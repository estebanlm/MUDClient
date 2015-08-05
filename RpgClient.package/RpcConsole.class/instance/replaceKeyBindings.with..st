accessing
replaceKeyBindings: categoryName with: category
	| inputTextArea |

	inputTextArea := inputMorph textArea.
	[ inputTextArea detachKeymapCategory: categoryName ]
	on: Error do: [ :e | "Do nothing: It means there is no previous category" ].
	inputTextArea attachKeymapCategory: category