utils
readIcons 
	<script>
	
	| repository |
	repository := self package iceRepository.
	self uniqueInstance 
		readIconMethodsFromDirectory: repository location / 'icons' / '16';
		initialize.