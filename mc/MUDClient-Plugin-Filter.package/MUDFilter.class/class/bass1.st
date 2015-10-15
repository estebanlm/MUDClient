private
bass1
	"self bass1 play"
	"(FMSound lowMajorScaleOn: FMSound bass1) play"

	| sound |
	sound := FMSound new modulation: 0 ratio: 0.
	sound addEnvelope: (VolumeEnvelope exponentialDecay: 0.95).
	^ sound setPitch: 220 duration: 0.2 loudness: 0.3
