actions
exportLevelMap: aRoom
	Clipboard clipboardText: (LOTJCartographerASCIIExporter room: aRoom) build.
	UIManager default inform: 'Map copied to clipboard'