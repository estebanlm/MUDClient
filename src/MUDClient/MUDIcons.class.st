"
I'm an icon library to be used for the client.
"
Class {
	#name : #MUDIcons,
	#superclass : #Object,
	#instVars : [
		'icons'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'MUDClient-View'
}

{ #category : #'instance creation' }
MUDIcons class >> new [ 
	self error: 'I''m a singleton class. Use #uniqueInstance'
]

{ #category : #utils }
MUDIcons class >> readIcons [ 
	<script>
	
	| repository |
	repository := self package iceRepository.
	self uniqueInstance 
		readIconMethodsFromDirectory: repository location / 'icons' / '16';
		initialize.
]

{ #category : #accessing }
MUDIcons class >> uniqueInstance [ 
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #'accessing icons' }
MUDIcons >> acceptIcon [
	"Method generated"
	^ icons 
		at: #acceptIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self acceptIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> acceptIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAALxJREFU
OBFjYBgFjKQGgcN8Lwlmxr/z//9hztiXsu0hCykGQDXvA+n5x8zwE0QT7QJkzX//MzsdSNz2
gmgDcGkGGcAEIkDAbZGbGISFSuLTDFIJNsBpobvZ33+M91wWuHsjayekGW6A3X3LM8DAWPWf
gWEdzBBiNIMMQATifwZG54Vus4FCsf//M6YzMv4vAylADjAQHx0gDADJAA1xWuQ+k/E/QyqQ
d52QZnTDIHyQS+a714K8gF3BYBMFANr3W9XY4WkuAAAAAElFTkSuQmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> addIcon [
	"Method generated"
	^ icons 
		at: #addIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self addIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> addIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAFlJREFU
OBFjYBjUYI76hv9AvAqfI5nwSRIjNwwMYIT5ExRgMDYR9OqUmwFhIHUsSIpXI7FhzFAGhv9P
GBgYj8MEwPR/BlQ+iiQSZzQawYGxmoHYAEMKO/oyAdYCFhaMaa9UAAAAAElFTkSuQmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> alarmIcon [
	"Method generated"
	^ icons 
		at: #alarmIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self alarmIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> alarmIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAkBJREFU
OBGtk01oE0EUx99MspNsQpqk6RbSg9KDWtFeTKTFg6IURYr14AeiJ+ml9xZK4sEV6YfYXsWL
Bw+9eBARUapUEI8JiAebHtLWhFQNpk1Nk3R3srvTmdUNSOJBdGB3Zv7v/37zdmcG4B8b+lN+
Yjo1yoPnRJwBLM4kjz9q53W3E4UmknnilV9j0f0dgIGpfsps2YAjhztVQUhMpR5yctBD0aiq
xutCa/sJyanUNQvDdQTsjDAxQG81qi3WKtZMJOIjgPDR2UQs2wJQVYZ1kl6QiHWx/1DQUBQr
gBCCjS9mbWW1hotFreKyGhcezA+lRLJov/0DKqXHw0Fp4OqIImuUQnc4aJu6Osv+0ycUePyk
UK5q9BIXmwBsO/hr4v5HP3JB8vJwtDefz0FA9jghiEbCYBgm9PUZPZbhHhNeJ9isgFB90B+Q
NkMdUoi498Od2TkghMDw2SEYiB8Dv+yFk7EDsJzJlao7+iAHLAlIswKGUJghTVleL4DPJ8Pd
W5OwXanD0xevncUgw2PCI7yO2KwAMbTWoKR2cF+0gzEGkiTBvduTfJ9+bpTQenu64Q3dqCHG
1hxAs4LpZOwD1c36s6UVuqtTOy7LMsherz2mhgEv32d1Sg1deFsAfCWGkTmWz8k7xc1dmi18
hbqm20/+WwlW81uNz+ueKgZ8U3gdQMtB4ndgBGNrIRz0/FAUkIXxewnVy9tayLLwDX4nnjvJ
om8BCHF8Lt1FKDuPXdYpMbdM/I4S9Gp+Il4S8//a9gBwTN1FyTY4jAAAAABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> aliasIcon [
	"Method generated"
	^ icons 
		at: #aliasIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self aliasIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> aliasIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAd9JREFU
OBHdkc9LVFEUx8+9775fvpmR0WaikXhCSmC8VdgiaKA2Fi1y02ymhbTRcCPZIleRIEjg/6BP
chFDGxdqUJhgC90MhAjmCDVR5K/BSd+Mvvvu6b4HEwbRol1dOPfX53vOvXwPwD8/CLiuBR67
n2D61ZRpdliKmqqcHFf36rVPngjeACKPMfVGq2HacVVLepzvbteOSofcXwaqTDHwlAwgGb5j
d8aGna7W0JIdD2G6tJ5xN9dseTzpbe+0HzmXGsx2S+vt05tr14D7SxQG8h8ARP85w2xmFGC3
hpGtZ3QjLguPgiAjGaPpF5YKGeAQDOaLLFJrsXez5a2vadM6f7E5CcX9HSh83PgMnC+AFcff
Ml/Mh7kkKiAnc+pFW5sSH6wHwRWNstktrzoJ/bmDkP+JNfL/ev35g9MVHt/tuUmAPJVuCCnQ
CeB3geTJeGF+8bQu3EcF7mW7c4LCxszianEkd6tXtu5lgyEiEBLJOCK5PV6Ye9WXvewIUBx3
aWUmIvls9/t0S+K1oao1mfhQhiYD9g4OBQ8EOduSiHTyqi7df8b9IPmlUr3+/O2KE3VB1/QH
lao3xii9gFJKELe5gDICTlBC/PK3/TFKSZopihUgDoCAkhnT+sJH/oPxA0D4yKXjqa/yAAAA
AElFTkSuQmCC'
]

{ #category : #utils }
MUDIcons >> base64ContentsOfFileNamed: aString [
	"Private - convenient method"

	| file base64Contents |
	file := FileStream readOnlyFileNamed: aString.
	base64Contents := (Base64MimeConverter mimeEncode: file binary) contents.
	file close.
	^ base64Contents
]

{ #category : #'accessing icons' }
MUDIcons >> cancelIcon [
	"Method generated"
	^ icons 
		at: #cancelIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self cancelIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> cancelIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAANxJREFU
OBHNUUsSgjAMTYQVXopL6ELOp+PIJbgUXSkxD31MW4ruHDsDgbxP0kTkr461bY1nq6kSviMZ
YKjG67gL55IJcsDAifHFAEZm+hCVY25CMbCZw6oeNfqWmCgmt/3UdMBhCDFzOgx36hIDJGMT
Vell8pzKoSQGf2VAk1CHi5kLQTLpm6k5xZWRx0lm8Eq93155OdustQGvgLZRGddAJ/lgaZ7s
nGIOzNvuMAMXG3IeMaMuvsoyg1yMDZD4CUtup2pVadowmlfqq5057D+PqIQnz/P/G07eb+MT
Ia2WuKnPn6QAAAAASUVORK5CYII='
]

{ #category : #'accessing icons' }
MUDIcons >> clearIcon [
	^ self trashIcon
]

{ #category : #'accessing icons' }
MUDIcons >> configureIcon [
	"Method generated"
	^ icons 
		at: #configureIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self configureIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> configureIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAcNJREFU
OBGNUk0rhFEUfu47jIyvJivKx8LCQmJhYcWeMBPDwleZX2BrISkLGwtLCyNZSNgodlLDQkhJ
KUuZEUk+w4z3es6dwXhnMk497/l6znnPvfcA/xS9AB/R6aQrZyDV1xoKi/AgB/l4x43JeVCE
Ryg1wi/FSi1Is0MIwkaExYffuRecwIUIp+mX2N8NFALkFBO3ZDYZAHf0C6HRS52lgQcd5Ghi
Vg3iQCA28YEHdFNnafCCUXIUW7QI2UjCdqEEk+LnJKI/32gXWrWFCpeNPUZLTUZhSIfQmGTV
G22jUnRaA60wwz822ArjeMME3Ngn74pzbJtChT7qZx7iSHzzjFE/mvhkK/SPCTm3xJ+IHaL2
rQR11a2YY+NcFCCoAibHVHICbWOKJVX0BetEmAgSbQTy7jGshjEgtlPMESyNUY68y+RF+Tr8
Qop2Yot3cUpz8/kV8xLLJGYPLLfZsngmguaT1RQiY074ZoJYHEs8tJe+N+LDGnWYhXIEuYz2
q5gZPyS+U0wDZWGaK9tM8jkLfSQJYoTcdGk8F8vUf8t1D9eTwgnOCE2Mif8VFzuT8Ke/5dLP
HdeotixslK2aS/xNcHifk4d6zdClN9IAAAAASUVORK5CYII='
]

{ #category : #'accessing icons' }
MUDIcons >> connectIcon [
	"Method generated"
	^ icons 
		at: #connectIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self connectIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> connectIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAARdJREFU
OBGlkj1Ow0AQhd9sQmx+irQUnIEGCZBQUiEl6UPHGShogY570FAADTRp89NxBJQbpI+ULGQf
4wStjL22LGUly2/G33xa7RrYcknRPIe7F5DV4fq7gZWW/Qix9VCThGDiXgHZCBzelQsKTEiA
0c6x9jfDCWD4lLxCKyyoSTcFz7BnB6n6XwwLID1PEc9ygm9fZ0JOwCGaIM48V7L9hMkfojQu
U32rB3DHSQyVfkl7ce/FfyEvgDnQO3hbfyc7IPuaf+DceXa4tOYAEcfRQh9y1HgognNn4MH9
+FRzpHv/xMw++n4mFAvgWsrO9We6liusMnO+LBFIIriV9nLq6apBr7LOcfxShQ/vwMRHcLWb
KoKtmV82akR/ivnDogAAAABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> connectedIcon [
	"Method generated"
	^ icons 
		at: #connectedIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self connectedIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> connectedIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAXhJREFU
OBFjYBhyYMLSdYUTl67rhTmcBcbARfcvXh/AyPg/iuH//0+MjEy3/v//3/mfkaEIph6nAUF5
VY7qiooaQM0TgYpZGRgZGf79/3+diZGxPD86sB9mABOMgUxH5JRJASUy7z9+1PH3779bMDmg
GZr///9Tg/FBNIYBEUXVsn+YWG4xMDEe+/P37+HTFy/KAg25CtfEyMgHZ2MzwNLY2EhbVfUk
0L39QGfvQTPk9///jMuQDWBG5kxYstaUgYFxBycnhwofD/fBV2/epgNdMv3fv38sL1690mVl
YSupSY9egqwHxQuMDAwyQElWkAIBfn57HXXVg3CX/Pm78/bDh9eRNYPYKAb8/89yDSj2GaYI
ZAjQO/uAhrSw/PtTsGZCywGYHIxGMYCB6a8X0BU8QEmYIb+FhPgn/fv/R2PFlK5nME3INDwd
gFIYw3+GPnAi+ce8jZHxj9Z/BoYn+dHBp5E1oLPhBoD8D9JcEB0ESyQ30RUPTj4Amr+LBlV4
ACYAAAAASUVORK5CYII='
]

{ #category : #'accessing icons' }
MUDIcons >> deleteIcon [ 
	^ self cancelIcon
]

{ #category : #'accessing icons' }
MUDIcons >> disconnectIcon [
	"Method generated"
	^ icons 
		at: #disconnectIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self disconnectIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> disconnectIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAT5JREFU
OBFjYKAQMOLS/9nFQvP//3/qIHlGRqabvHtOXMemFsOAT85mAUwMDFVAxaZoGk7/Y2Bo49t7
agOyOIoBX5zMyhkYGTqQFWCw/zNU8Ow71QkThxsAtXk9TAIfDXRJIMwlQNdCANTZYA6zgTED
a2A4TArMBonBALJasAGgAANKwv3MpKjCwJZdxMAaHAnGIDZIDAmYQvUwsIAEQaEN9wuQ/3v9
SgYGJiYGtswCsJ5f0ydAxMA8CAGNoetwLyDJkcQEuwAUzwz/gUEDBSD/g2wH2QwCYJf8+4fi
CrAeoBzc5V+czU4B+eBwAAUYyM9grwAFQQb+u3+H4e+Fs0AeGJzm2XvKDMSCG0BxNILjFZhI
IBbgIYFqYGkApAolEEEpDJRIgOKnsRgBSsqByKkQpAbuBXQNxGYmdH0k8wE/9WzIXASi2AAA
AABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> disconnectedIcon [
	"Method generated"
	^ icons 
		at: #disconnectedIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self disconnectedIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> disconnectedIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAZxJREFU
OBFjYBhowEiMA/qWrjdjYvgvz/Sf6eo/xn/uQE0y+dFBxSC9LPgMCMqulre3Mjb4////aqA6
1n8Mf38w/Gfk+M/IUATTxwRjoNOhWaUSTMz/r96+extkEytEnpGDgeH/D6BLdsLU4zRg9bTu
F5YyN5a/fPPR9ta9uwdhGhgYGDmA3tCG8TEMANkMkvx/kC28yHyrt5Lgy6ZXb97bIRny+x8D
40OYAcwwBogG+ZmRhemmlpnN2zCt4xIMzAy1rvFnVvl6qDE9fccc/+vn18PCQsKFhdFB+2D6
UFwACjBREaGTDIyM00PXFH9gtPl19f8RNu0OpyWpFjI35rx489Ho4LGzF2CaQTQ8GsFR9f//
EaAY68179w68fvPOnuH//8zVIb0CQLEHjPa/VoK8BwobkEYYgLsAFM9AQXBoqyspOQBdchDu
EqBmkAZ0zSAxhAHARMIIjCKQIAhADdkPNKQXFrAQGVQSbgAohf0HRhGSIb81lJUm/fvLqI3N
Zpgx8JQISp6gFMb4n3nnf2A8g6KqKDrwFEzh4KUBZ42bvpiIMiMAAAAASUVORK5CYII='
]

{ #category : #'accessing icons' }
MUDIcons >> editIcon [
	"Method generated"
	^ icons 
		at: #editIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self editIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> editIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAOZJREFU
OBFjYKA3eFZcbPw/NJQZZi8TjEEMvW3b7rg/LGx7nsnJLYUZQrQB3+eKJvxm52i/4Ozx7C8L
m/szRUUVYiwFq/k/nSH1/wyGf5/mKTzYuPfwU5BLYJoZYQxcNEgzAyPDTKA8SO3/H6yiSZzJ
rxfA1OM1AF0z0Ig0xnSGOTDNIBqnAcRoxmkAsZqxGkCKZgwDSNWMYsD/2QxxDH8ZFgAFwaGN
LcBAGtABIiGpsmUwsDE+Ayr4T6xmuGFTG3SsVvao/f9/gO0Y2CVwGcIMFpASFjbGd2++sFkz
Ovw6RlgLlVUAAERRWATdtLJ4AAAAAElFTkSuQmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> filterAlertIcon [
	"Method generated"
	^ icons 
		at: #filterAlertIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self filterAlertIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> filterAlertIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAX9JREFU
OBFjYBhywHnZt73OSz5rwRzOAmPgo1et+s/8XPFX6P//DOWbbv8xYGBk1gaqvwbSg9OA/vP/
BRh//3IHavJ+xvjTg+E/oyg2S+AGWHqtmc7GzpkBU3TvxN3jysayloyMIBEwAZNCoZlAPA3T
ScX//v2Da0ZRgYXz+fjZSG3tqTwgKbAB/xkYTbGowyn0593HwL+c/0zgBjAx/J/DyMj4HacO
NAlODaXaG2dyD8ANuH46b8//f/9if3z/wvDj+1eGf/9+v+HgZnsEVPAZTS+Yy6GscBMmDvYC
iHNyZ/jaj+9ePfz49iUDlyCDkLSGRC8nE5swI8N/TwbG/3OBSt7CNCHT8FgACf7//389IwNj
wcOrj58VmLGdhircAaR3zN//P+cTz69yILsBKg6m4C4A8ZgZGdZBJWU0TCY7QNlgKtGR8Ue+
KXsjMEJT2P9/3wmTQ3HBtVPvjmqYCr8ESvIzMjEIwBQh03ujuUHewQ3ULKdLGxvP5MKtgsoy
AL0mdyBU7hK6AAAAAElFTkSuQmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> filterRedirectIcon [
	"Method generated"
	^ icons 
		at: #filterRedirectIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self filterRedirectIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> filterRedirectIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAOxJREFU
OBHVUbsOAVEQPZfdbIFsIVEp/YRWpdOJikqofIFCsYlfIAqt+AKVL1Eq0IrE+5pj7cqKi0Ii
Jtk7Z86cOXsnF/h1KF5AD5DFCTOBzocX2iGOnKpjfjXg0LqNQgyYCLTfmBzOQDHlYUqdzPhB
QgONoDZlaoJhakIDFkkPQ0ldYkN0b5qwHa4QMPIHtWljJI1ywDELP054qAgv8B7WHfqIAm2h
trPhxCxkyJ6PWDkH1B6H2YusQIKhOtg6aextF3l+xOT8bvR8ahCVvK7+x2BhWuTdCkt5tKpq
omUyMPK6h5LuwzUKvtW4AHRpMfzc2DxQAAAAAElFTkSuQmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> filterTriggerIcon [
	"Method generated"
	^ icons 
		at: #filterTriggerIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self filterTriggerIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> filterTriggerIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAdZJREFU
OBFjYBg0wMzd35ahoYGJVAcxgjQk1vW437l4pp6Th/eMlLLqYWIMuX/5fOTB9cuDwAYEZZV9
Y2Bk5ETXuLinkYGLg52heeo8hgvXb6FIv3n26O+P7z9sGc09fS0Y/jEdR5GFciyMDRm4ubgY
Tpw9z/D127f/aGr+MDAxK4FdkFDb/f///38M3z9/ZuDi44er+/TuDcPTOzfAfMb/DBYndm08
aeEecIqZ4W/iXwamFSd2btSFBNp/hgZGRiaG79++wDWjM0CaQWJAm3R+MzAqgDSD+Cwg4vrZ
I6sZ/jE0AJk/Xj26v/znT8Yidrb/0zUtbJZ9+SC2SVJBhUFOy55zdX/RdwZGBk4g5gLpAwGw
Cxj/M4ZBuAwvGBgY+dnY/y9nYP43kenfv1vsnFwM379+YeDl+mcMVvOP0Z2R8fdOqHqIC4DO
CgUJ/GdgnH5q54YumOTJ7ZsZostbbr56/ECdW5m3FCh+5OTuDbtg8iCayczD3x1Ia4E4zEyM
YH+C2DDAys5Wy8HFzfDx7Ru/hNquBJg4jGZi/Pv3HpCzAIgfM/5lYIZJwOgFTWWrhSVkVwK9
8uYfA/NFmDgmDUzGDg6hPJgSDAyxJd3cidW9stjkBl4MALbZnkrjss4BAAAAAElFTkSuQmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> findIcon [
	"Method generated"
	^ icons 
		at: #findIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self findIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> findIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAbBJREFU
OBGlUjtLA0EQ/nZPLypGxQdBkKj5A4LgCws7YxVfoEWKkMba3p8gIggWgoE0EVTQoJWSJlYW
QgI+CiEgPgOCISaKnnrrzsYLSZAQceBudmfm+27mmwP+aawU7/P5hjnnHiFEN2MsJX00GAxu
lNZZ9yICv9+/hvrWOd45CNgdwHsW4uEUInlxIkn9gUDgzAJaPk9AYObsm+P9PlRxhpZahowB
vH4IiMQRzNhmwjCM3lAo9GyByWv0oraZvW1VG5lHh11Dj0PDhwl0NXG01XEkdSdgvDZr6Rst
Ho9HCGMZpwPNrNoGQ+pNIHr9icsnE8d3X8pTDeseJjdNr0JTBCSYmllmXmTLhWbdWWM7hV2F
OTorAlKbBCtruXyqtMbqIEpqlzNxG6N00fwUUAS0Z1oVqf2bifQ9zPN9mKa5UppXBBSkPdOq
zPg2CABILd4zuRVGl2kLWVmklCwkyf8HFPR6vQ26ri/II6ntkg/NHFFf5nzo6jG9WKNXhQ92
tiZl/O82OjGzN+AeF+6pmd2/o38QFsnY1OwahfIaVMp4GN7yNNXZ1murbUuVYsrWfQMVVqUm
0m5KSwAAAABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> flagBlueIcon [
	"Method generated"
	^ icons 
		at: #flagBlueIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self flagBlueIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> flagBlueIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAKpJREFU
OBFjYKAmcItKLqTIvJh5Fx/vvvd7/+77vx2INYgJi0IHhv8M+4k1CJsBMDOJMgifAUQZRIwB
cIP+/2dYvOfBb0uYAIgmyoD/DAxPGP//z/7zl0XFRYH1OLIBLMgcdDZII9P//+2//7HO9VJl
/IkuD+JjNYAYjTDDUAz49e7RW8b/mnhthGnESrtGpa7CKoFHkKhAxKOfuFgg2gBGhn8oUYRP
I9XkAJOVTeMbkVBeAAAAAElFTkSuQmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> flagRedIcon [
	"Method generated"
	^ icons 
		at: #flagRedIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self flagRedIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> flagRedIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAJxJREFU
OBFjYKAmcItKLqTIvO3mko//2zLs/2/D4ECsQUxYFDowMAINIdIgbAbAzCTKIHwGEGUQMQYg
G7T4vz2DJUwARBNrwBOG/wzZDDwMKowHGY4jG8CCzMHCBmlsZ+BlmMu4neEnFnkGXAYQ1Agz
DMWAh1wibxl+P8drI0wjVto1KnUVVgk8gsQGIk4jqGsAI8M/lCjCaS01JQDPES5jSSK86gAA
AABJRU5ErkJggg=='
]

{ #category : #inspecting }
MUDIcons >> gtInspectorIconsIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list 
		title: 'Icons';
		display: [ icons associations sorted: [ :a :b | a key < b key ] ];
		icon: [ :each | each value ];
		format: [ :each | each key ]
]

{ #category : #accessing }
MUDIcons >> iconNamed: aSymbol [
	^ self perform: (aSymbol, 'Icon') asSymbol
]

{ #category : #private }
MUDIcons >> iconSelectors [
	^ self class allSelectors 
		select: [ :each | 
			('*Icon' match: each asString)
			and: [ each ~= #systemIcon ] ]
]

{ #category : #accessing }
MUDIcons >> icons [ 
	^ icons
]

{ #category : #'accessing icons' }
MUDIcons >> importIcon [
	"Method generated"
	^ icons 
		at: #importIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self importIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> importIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAYtJREFU
OBG1kjFLA0EQhd9ego1KFO4iYmMl/gBBLQK5TkUtBK8Q2wRSBvwf2okRLERFIwQtRAvBiEgE
TR8EWwvvRCwE0eTGmY13JghnEVwYZvbNN29vlwP+c5nZcl4i6gwjqqkIkxJRTKRB1GDQ69hA
BU6tOZG76u+qN25YG/nW7z/isYnX9dRLKye1NkhmyzkfMHlTc1+eSjh0GmbmakRBm4AQm/A2
U/dYLMas/uQCAaP86d5TIb2ur0CgBD/WHJPbVl9yVZxlwAA5EnqYNd0jbDE7xdte4dquYGUu
HYAOyMe8MlB3N9OnAlmZ8jRrcdaOYdCMu2GfiS6r7RHdIb/EBlUG95Si8SbCp3AtGh937Q7i
PNB/GSQfMcv4ADd6QOohBJs1axhuMmEHcSlX90r6Z8kv2UfI3p2Y9Ob4yq8GWEPRrSJj2VPd
RRTGPn/4hYo2UD6C37UigAfsBsOSnwt2jZOEXq28NiCodwWy13ZKxQD6I0/yzIUw+hHrPq0Q
Yf+PobAtrMyEQifFF6q6j0umU1k6AAAAAElFTkSuQmCC'
]

{ #category : #initialization }
MUDIcons >> initialize [ 
	super initialize.
	icons := IdentityDictionary new.
	self iconSelectors 
		do: [ :each | icons at: each put: (self perform: each) ]
]

{ #category : #'accessing icons' }
MUDIcons >> logViewerIcon [
	"Method generated"
	^ icons 
		at: #logViewerIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self logViewerIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> logViewerIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAhlJREFU
OBHdUstrE0EY/2Zmd5OaJ6mlamxja2MDsR5sLJZYC74Kudho8dAKInj0YG9ePHvxIKXgWUgv
gdSLWEV8QK2gBWm6FMQ1icYGTUPTxpjX7s6Mm2iCiv+AzmG+j+H7fi8G4J8/6G8OZqLRDloT
gwA8aAxQRvCSpLGXVy+d2/xz/jeA2bvz7UzENxljVwjBqsVsKjPOUbmq7uCcEw7sDlfxjenL
4e0mUAvgdiR2BCH8QBCI7XB/X7ptX7c3lskBQQjOu3fCdiKlxN8lPVSneY7Z2LXJidU6SANg
JhI7yhF66rBaqhfGRsX5bMF6cfltk6RR7w374bTLWog+fA7FcgUzgOPTU+EVNDsX8zDAcYfN
QqdCJ+2GdMH7aBnebxkqV18BEAJwcAgOtTshfmoQdEprkftPKl9LZV1QtQGsI+7o6dotnx0d
ztWXGQdIlioAuS8Anz8CrCcB8huQKFUbSgRCTKGRofVe964VKkquhoW1tU8uKmoxr8fdY5Yk
z5lFGR5n8wBpBQBjgL37YdzIoW6jUq0llHTmg4lrYZ/PV2yFKMvJTibxue49nc4sx4OhJdlQ
8oO139YGC8EBsOvq68zG5pagiZN+f5fB8DPEhjbjepZKmZ0qu24ShRN2u40oOj9g8LM+Akqh
+I3VauoCLRVuBQIBrbnTUtB8qNc3itKBdTxixHEMEKfGh3ohUfNik/XX2f+g/w7NX9astFoj
ZQAAAABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> map1Icon [
	"Method generated"
	^ icons 
		at: #map1Icon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self map1IconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> map1IconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAapJREFU
OBHFUs8vA0EU/mbs2moaSopUEb8OqEjqxMkfUCQOJM4cnFyd/QH8B1wdHEiIey/iQASpQ4XE
qdiWVnVZ1R0zo7udjT/AO+x78773fTPv7QP+24j6AJY/GAUaFsDIIqz0IEjTKWjjJomtHoo6
FSeRmbjIeQIsd5TmJVygZu8XbgRQw0YwfqfiJDIrubRepZBrScaA21sL5lPJeM2X6uJ1EhQB
4CVXwnO2IOGc+QXTtJHJlLmv4OmxgN2dlEL9DTU1UyxY+LRsHO+fYWoyAEoIksl2WcKCMbSE
g9jdTmFpedqj+QT6hzolEO1pQ1jL8Al5IwKhBJH2ZgyPdXtkEfhacJFwa8hHdvOOw1AsWu5R
ep8AM4twsnk491kJMk64vHzzCNWqg4f7Z+8sAl8LzP6CvbUHOtSNq5EWCIHyh4OTkwL0UAbX
5w9YWqn3/0cAdgW0LwoSaEQiwdsQN2gU3xX+P0MDGJ/ohxHQZd79+F5AB7tgrM1zjNzITXRs
QxRqOh+mrnHv0jheM2UGPMmwAVKNizUlvesB6B1zaAin5CYKUQV3Bf7f/wCwxo3JsMPrJwAA
AABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> map2Icon [
	"Method generated"
	^ icons 
		at: #map2Icon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self map2IconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> map2IconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAV9JREFU
OBFjYBi0oLlMLKi9Qk4Q3YFttZLXO+qk7sDEmWAMZBqk+T8j41oukf/7z92wloLJnb1j5cTF
y6Ly7///3zAxFhgDmWZh4tgvJM/yRUaFR4uB+d/lhQtVvz2+/kny7fNvn2xD5JyMlY4ehqln
hjGQ6b1HPv5omKD+mleQ9cf/j7+t71z7ZPrz218tFjbmQg+HC+uR1TIic5DZp+6bSjD/Zbn2
/8MvcROTs3AnI6sBsbGGAUjCTPH0CwaG/zeZBNnsQHxcAMOA1iqJsLY2aWGQhq+f/u6+c+lj
ES7NIHEUL7RUS4T++/N/lZQKz39DR7H7Z/e8lH5x/ys74///wbVdr9ZhMwjFBXaB0hKiMlwv
Xjz4Evn/P6MbMzNTOycvyz5QrGDTjCK2f78Dy5m7lvdO37GwRpEgwIFHo6bir7tPbn4RDvG/
lkVAD4o03Av//zH8+f7l9yMU2SHBAQDZ8HwrzJP/kwAAAABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> markerIcon [
	"Method generated"
	^ icons 
		at: #markerIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self markerIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> markerIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAATdJREFU
OBGtUktKA0EQfTURwQiuvYELMUiMit+NIuQOegdP4hmycO9eFMTPQvEDiqAn0LWgSNApX9d0
m+mZ9EoLiq73qZqmeoA/hgzr1zk0MY5VKDZMFxzjHedyg4+qvzZAVzCNDEc0TlbMr8ixKRd4
LPPRAF3CGEZwR8MUM4fg1syKNs+M+YwGZuUEn8Z7MtRg8zZBaO7KKeZdclCXfG7aN3YGDcXU
Ml42ILhi42EQrCbnceHxwF2rHC9lkKgjTzwgw4E1KRZ0HVthgNXkDAePF6MlOk7XcM9jhjls
iQ9yhpbzhYhvULB7Xsz4H3QsB7sKWui3p/kFVjSwz6anmCRynNMqUbsB3/iLz7Zb8cFxptWE
BMFd9Jjqs5ewcW4idBETGMW1yX105BJvCWua5tdbLtOOf1B+AI34TSDN66hGAAAAAElFTkSu
QmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> newFolderIcon [
	^ self openIcon
]

{ #category : #'accessing icons' }
MUDIcons >> newGameIcon [
	^ self newIcon
]

{ #category : #'accessing icons' }
MUDIcons >> newIcon [
	^ self addIcon
]

{ #category : #'accessing icons' }
MUDIcons >> noteIcon [
	"Method generated"
	^ icons 
		at: #noteIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self noteIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> noteIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAK1JREFU
OBFjYBhowAhzwP+D7P9hbGJoRvufYL1MxCjGp4YFWfLXVwaGP7+QRTDZLGwMDGzcCHHquuDn
FwYGkCvwAZDtyC5A8QKvOD6t2OVQDPj8EtMFINvwGYxiAD6F2O1nYEAxAJcisDibBAMDjyFE
yZfzQPohmE18LIA0q05kYBByZWD4/b4ZYhIDA/EGgHS83cLAcLeymdHuUx3MAOKTMsgLQJuR
NcMMGVgaAOPuI0jBUIwUAAAAAElFTkSuQmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> notepadIcon [
	"Method generated"
	^ icons 
		at: #notepadIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self notepadIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> notepadIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAb9JREFU
OBHNUj1v1EAQff7a3bMvPuASFCFECpAoLsg0/AUKeqjSp0gZiR+BlDIFPRU/gIK/QMOJnBAS
UZToiKIkJLlLHK/P8ZqZDT6ddT8AnmR7NO/N7MxbA/8aTj3Awc8fm1KpNdfxhq7nf3Vc9/Mo
Tb8w34miF5UxL01589xU5cNc6w+PnjzdYs422EmSj9H77VeFUtEkzyGUglQtFOPxhEVBHItc
Z5hoDSElAq3TdH3j02q//8ZnQQW8RtxBKAX8QIBOg86uAd8TzJcU+56PsL1AzSUKISNbQ5xt
wCKGMZUtnGR0Wq7R6S7a/Oj0hE5WEK0WfGF72jy/3GlEQXZ5CRrOpiSJa9Qxc6yZRWMCx3Xs
/uwBn5jzGoROd8lOxB6wZhaNBmE7Jg80rWLIsGyq49jzA3SXH5C5CqPfp1OusYKpbs27ujjH
Be1dY3x+RmEFFYY0QaOkaeLCnbvgp8bx8MCGj1eTOjX3na5wuLeLve878DwPMoxw7/6yvXeu
OPk1xNnxEfLrFGVZ2n8k/tvKOvItSeha57G9v2+TGysr8yRlnvX7TtPSGdmg12ubIHjHKbco
3vYGg6sZ+j8K/wBItKUYDLABSQAAAABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> okIcon [
	^ self acceptIcon
]

{ #category : #'accessing icons' }
MUDIcons >> openIcon [
	"Method generated"
	^ icons 
		at: #openIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self openIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> openIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAOpJREFU
OBFjYBhowAhzwP9FDDYMfxkkYXwGVoadjDEMn+B8HAywAf8XMCQC5eehqTnBwMLgTsgQFrAm
RgZPhv9o2hkYLBj+MHwEGo4OvjMwMpQwxjNMA0kwocsSwecEWjb1/yoGZpBaiAtguhiBPhIT
ZWAQFoKJ4KPX/z/6OwXVBdxcxGoGGezLwMLmi2oAOzs+GzHl/v+/gGoAB0kG/GX4/uMqqgHs
HJi24Ba5zej44AfCAFAAsrPhVo4uw8h4GSQEMeA/w3awZpAhRIP/60FK4Tr+r+P1Z+DmsidK
PyvzAUanZ5uIUktzRQAu2SzbuQNz+gAAAABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> padIcon [
	"Method generated"
	^ icons 
		at: #padIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self padIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> padIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAOJJREFU
OBFjYBhqgDE4v6oQ2dFMyBxC7OD8SjPG/wx8yOpYkDnY2EG5ZTJMDKwh/xn/mwLln7KysnUh
q2NE5qCzQwsbhP7/+7Xo3z/GFj1h1lMNDQ3/0NXgdcH/fz+tgDasXze57cQ6dJ1QPmPv3quh
Qjxcq3DI4xV+9+VbGNgFapJCeBXikjxx+xsD2IBbz98xcLKxMHz/9QeXWhRxZLVwF8gI8zI8
efsZRSEuDkwtigtArkAGIFuQAbLrkNXCXYCsGMQG2YIMsLkO4oJ/jI+P33q2GlkxsWzG/4yP
iVVLO3UAqEFOtDTRJjgAAAAASUVORK5CYII='
]

{ #category : #utils }
MUDIcons >> readIconMethodsFromDirectory: dir [
	(dir entries 
		select: [ :each | 
			each isFile 
				and: [ 
					(each extension = 'gif') 
					or: [ each extension = 'png' ] ] ] )
		do: [ :each | 
			self storeIconContentsMethodFor: each.
			self storeIconMethodFor: each ]
]

{ #category : #'accessing icons' }
MUDIcons >> reconnectIcon [
	"Method generated"
	^ icons 
		at: #reconnectIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self reconnectIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> reconnectIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAXdJREFU
OBFjYKAQMGLTn3bGmFX4Oa8yMwOjElDBU+bvItcbwlb/wqYWxYCG/Q4sf74yZTL8Z2gCKhZA
0vCF8T/DnL9sv7vaPA4/RxJngBvQsCqU7Q/nm60MDIw2QAMm/mdk2vKHg+Ey6/d/xkANAUCV
wUD6P8O//84t/vtvwgyBG1Cz2akHKJjK+I/Jodl/z3mYAhhdvtuFn/XH/x0MjP8l//9n2Mz4
7/8UkEFMIAU125yUgVQBw3/GImyaQWp+vf/6i/H/v31AN8gBbY2CuYIFJAl0VhTQ6a9ZztnO
Z2DYCxZCJ/7wCPz7///XYaBaoAsYH6DI12x2XFK72XkLiiCRHLAXiFSLVRnEAEaGm/8Z/hs3
NDQQNLBym60oskkQDUyMy4CCon+MDiciS6KzqzY6izP/Zb1du8UxDSYHNqDFa99doMAEYBT1
1W50MYRJItOgaGRiYtgATArvfv79tRwmB08HFCckkIkUJWWYk0A0KZkJWR9ZbADYm6JU62J7
0gAAAABJRU5ErkJggg=='
]

{ #category : #'accessing icons' }
MUDIcons >> rotateIcon [
	"Method generated"
	^ icons 
		at: #rotateIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self rotateIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> rotateIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0
RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHsSURBVDjLtZPpTlpRFIV5Dt7A
OESr1kYNThGnSomIihPoNVi5Qp3RgBgvEERpRW1BRBAcMEDUtIkdjKk4otK0Jdr2vgxZ3kA0
MYoaG3+cX2evb529zt4sAKz/OawnASgCBNm5LaE7vjVDutkA4mMdLV4TkvcCuvba2Iqd1pDh
WA33mQU+2oXVv07YfpoxuNWFuqVXoeqFCnZcgJwRm04p+Gk3Fs9t8PyZx/K5Hfbf03CGLRj6
2g2+rSR0K0D+vZXUB1Xw/ou5usJWjAaU0Gz3w/rjHey/ZjDLvKTD34KSyXzyBkC2JaYd4feM
qyNa3OQTREQePlXjrqSq5ssj5hMjTMd66ALDKDLm0jcA0s+NID6JIFmvQaNXANEKX3l5x7Ny
qTcb7Zg8GYtCOLoXuPcbha6XV0VlU4WUzE9gPKjF2CGFbE3G3QAmafDnShETF3iKTZyIblcN
za4Syi/deD6USscFCJwV6Fwn8NonQak5Hy1L9TAcjkJ/oAG1p0a1hYdnfcnkrQCBoxyyNYLp
1YCJoB7GIwqGgxGod/oZsQoNDiHSepNCceeAN8uF1CvGxJE25rofc+3blKPqQ2VUnKxIYN85
yty3eWh216LeKUTOSCayVGlIH0g5S+1JJB+8Cxxt1rWkH7WNTNIPAlwA9Gm7OcXUHxUAAAAA
SUVORK5CYII='
]

{ #category : #'accessing icons' }
MUDIcons >> runIcon [
	"Method generated"
	^ icons 
		at: #runIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self runIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> runIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAEnQAABJ0BfDRroQAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoA
AACFSURBVDiNY2AYBRhAZs5HIeOZ/1mJVc+ELsD6i8n53b8v9xSmfslXmP+fg2QDGBgYGBj+
M8gwMv6fwPjjy21CBmE3gASD8BuAMIiJgZGB8dcvTPUsBLTeYvjP2CrEwr38bDrjb2wKsBvw
n+EGAyND3f1XPGsZGhj/3SfKmVBAajSOAgYGAJG8MjGsAJhqAAAAAElFTkSuQmCC'
]

{ #category : #'accessing icons' }
MUDIcons >> smallConfigureIcon [
	"Method generated"
	^ icons 
		at: #smallConfigureIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallConfigureIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> smallConfigureIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QA/wD/AP+gvaeTAAAA
CXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH1QkaDBM5i2PCSAAAAfBJREFUOMulkktoE2EU
hb+Z+EyKTRQKgkqwzMaFtt1FrC40FGJm60JwIVSkqLUtElICFQNDQqBrQXRlQIriwomN0GJX
gtI2iUkXFYJVadOXhiBERDozbmaGMR3rwrP7ueece++5P/wnBOcjnVGigArI8Vgi9xdNNJ1R
bI7YUlT7r/YDqKaZq/j6tQHNbLQd6YxiNBp1I51RDPdaw6pFAcR0RolaZKur19vmZhwFePDw
PvFYQgZyACKgDt4cMp4+mzAA9fatETbX15A6Jer1r/das4ndGRUsMYBgFW8MDBqatiXoum7o
ukZhfk4ovC8CyDsFK7R0sBHpu0i5UmG59gUgGY8l7v7zjE68yr80SpUS3Sd7KJYLmBNMArqr
QTCSOgzUrPeVkE7XCYmjR47RbDZ5N/cWtzU8TvH4cJi+UCcdAS/ZmU2Ot39LLn1eOtd9qoeA
P8BKbfnyhfD5+emp11XAABCDkVQXUHs0JjNbXmS2vEjHQR8A5t5yLv8CSZI4e7rX+mR2HiJQ
HB8OM/WmxJamI+7zs1Fv2iOaI8vZJ4850O7nTKgXYMxpAMDuXR72+A7x88cvsvkFgHCrSS6v
Uv1Y/SNsEWBl4zv7fQHa9np4PvMBIPxpcnTaSTRNkmvrqwtA0r5CMJK6BEw4uNvEO+E3N+LV
9uq8VLwAAAAASUVORK5CYII='
]

{ #category : #'accessing icons' }
MUDIcons >> smallRotateIcon [
	"Method generated"
	^ icons 
		at: #smallRotateIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallRotateIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> smallRotateIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0
RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHsSURBVDjLtZPpTlpRFIV5Dt7A
OESr1kYNThGnSomIihPoNVi5Qp3RgBgvEERpRW1BRBAcMEDUtIkdjKk4otK0Jdr2vgxZ3kA0
MYoaG3+cX2evb529zt4sAKz/OawnASgCBNm5LaE7vjVDutkA4mMdLV4TkvcCuvba2Iqd1pDh
WA33mQU+2oXVv07YfpoxuNWFuqVXoeqFCnZcgJwRm04p+Gk3Fs9t8PyZx/K5Hfbf03CGLRj6
2g2+rSR0K0D+vZXUB1Xw/ou5usJWjAaU0Gz3w/rjHey/ZjDLvKTD34KSyXzyBkC2JaYd4feM
qyNa3OQTREQePlXjrqSq5ssj5hMjTMd66ALDKDLm0jcA0s+NID6JIFmvQaNXANEKX3l5x7Ny
qTcb7Zg8GYtCOLoXuPcbha6XV0VlU4WUzE9gPKjF2CGFbE3G3QAmafDnShETF3iKTZyIblcN
za4Syi/deD6USscFCJwV6Fwn8NonQak5Hy1L9TAcjkJ/oAG1p0a1hYdnfcnkrQCBoxyyNYLp
1YCJoB7GIwqGgxGod/oZsQoNDiHSepNCceeAN8uF1CvGxJE25rofc+3blKPqQ2VUnKxIYN85
yty3eWh216LeKUTOSCayVGlIH0g5S+1JJB+8Cxxt1rWkH7WNTNIPAlwA9Gm7OcXUHxUAAAAA
SUVORK5CYII='
]

{ #category : #utils }
MUDIcons >> storeIconContentsMethodFor: each [
	| base64 selector source |
	
	base64 := self base64ContentsOfFileNamed: each fullName.
	selector := (each asFileReference base, 'IconContents') asSymbol.
	source := '{1}
	"Private - Method generated"
	^ ''{2}''' format: {selector. base64}.
	
	self class 
		compile: source 
		classified: 'private - contents'
]

{ #category : #utils }
MUDIcons >> storeIconMethodFor: each [
	| selector source |
	
	selector := (each asFileReference base, 'Icon') asSymbol.
	source := '{1}
	"Method generated"
	^ icons 
		at: #{1}
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self {1}Contents readStream) ]' format: {selector}.
	
	self class 
		compile: source 
		classified: 'accessing icons'
]

{ #category : #'accessing icons' }
MUDIcons >> tagIcon [
	"Method generated"
	^ icons 
		at: #tagIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self tagIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> tagIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPFJREFU
OBGtkrEKwjAQhnMptl30FQQXwUXci+Ik6Or7WCefxkdwSFdnwVFc3FW0Bel5V221pk0RDYRe
Lv/3NSUV4scBVTwGzkjE2MjlUK5hGO64ZxSgsmcU8Tn4MU4CrDb0Lwf5sZEtS+CtQDGmUF3E
N4/DhYISmPMtmgsu0qEJDDAzNn10N4X5mRNUwO9cVmeCr2EJR7Ykt4CB3REIm0xbWcAcBqHP
sccJpHWmOuRG9XjBnE0E4F33dJYprSOzIA9zNvcj0V83oXteUt/RRTqsCbhRLCmG9Zc8OyxB
5UQ0EZXrlwZNG7hym6hqPVPmL3t35QZLrfc6OVsAAAAASUVORK5CYII='
]

{ #category : #'accessing icons' }
MUDIcons >> trashIcon [
	"Method generated"
	^ icons 
		at: #trashIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self trashIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> trashIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPRJREFU
OBFjYBhowIjsgM1zbpoxMjDJ//nzj/PDm181///9VwXJMzIx3hYQYWthYWH6/p/h30PfFPVT
MH0sMAaYZmQ6/p+BgYmZlYlBWJIDWQpk0EKgHBAw/QMSzGAmkEAx4PGNjxH/GRhXwSSx0YwM
/yOQxZmQOTD2r19/wMzfv/8wgDAIwMTAHCQCqwFPn74CK3n//jMDCIMATAzMQSKwGoAkT5A5
agBaOoCFGAcHO5jJwgJPLwwwMZgaGI2SkP7/Z/zBAEzckpLCYHkhIT6YOrgYWA1cFM0Fog/v
bnstr5zGwMjoiqQGwfz/fzdIDUKACiwAhUVFUmIhBtwAAAAASUVORK5CYII='
]

{ #category : #'accessing icons' }
MUDIcons >> unknownIcon [
	"Method generated"
	^ icons 
		at: #unknownIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self unknownIconContents readStream) ]
]

{ #category : #'private - contents' }
MUDIcons >> unknownIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAWxJREFU
OBFjYKAQMGLTP0llGzsn8x9rJsZ/riD5f/+Zdn//y3I0747XT3T1GAZM1V7Fw/6H7QBQoTGa
4rM/WX45ZF8N+4IszoTMAbHZfrO1ASmgZsZ7DAz/yyEYxGYwhsqBlMEBC5wFZTAyMsSCmEz/
/kcl3Q48CWLPU91w8B8TwwmoXB5IDAYwDADanPaf4f//pNsBYM0ghf/Yft1m+MMGYnID5YDm
MP4HcUAAw4CUm/6rIVIQsoGhgQmoeQaI95+R4SCyZpAYRhiABGEApFlG3WABkB8KxF8ZGf8V
wuRgNF4DpDX064AKQWHy4f9/Bs+U60FXYBphNEY0wiQWaqwT/v2f6SmQzwoMEreUW4F7YXLI
NE4X/PrHZA5UyA7EJ3FpBhmEEYggQTBgZnrH8O/faob/DMdhQtho3Ab8/v2EgZll9X9mxsfY
NMLEcHqBkZnFEhhxqxj//SuCKcZG4zTgPxPYZoJewGYoSWIAAvlo3ua2Op4AAAAASUVORK5C
YII='
]
