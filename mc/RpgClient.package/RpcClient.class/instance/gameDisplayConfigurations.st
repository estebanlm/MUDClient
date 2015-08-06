private
gameDisplayConfigurations
	^ displayConfigurations ifNil: [ displayConfigurations := WeakKeyDictionary new ]