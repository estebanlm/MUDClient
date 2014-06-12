building
buildToolBarOn: aPresentation
	aPresentation 
		act: [ :me | self configure ]
			icon: RpcIcons uniqueInstance smallConfigureIcon
			entitled: 'Configure';
		act: [ :me | self rotate ]
			icon: RpcIcons uniqueInstance smallRotateIcon 
			entitled: 'Rotate'
			