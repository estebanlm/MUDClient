inspecting
gtDisplayOn: stream 
	stream 
		<< self ROOMVNUM asString
		<< ' - '
		<< (LOTJTextDecorationParser cleanText: self ROOMNAME)