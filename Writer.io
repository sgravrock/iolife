Writer := Object clone
Writer clearBetweenWrites := true

Writer writeBoard := method(board,
	// Clear the screen if configured to do so.
	// Only works on Unix-y systems.
	if(self clearBetweenWrites, System system("clear"))
	horizBorder := "+"

	for (i, board minX, board maxX,
		horizBorder = horizBorder .. "-")
	
	horizBorder = horizBorder .. "+"
	self writeln(horizBorder)

	for(i, board minY, board maxY, 
		self write("|")
		for(j, board minX, board maxX,
			cell := board at(j, i)
			self write(if(cell isLive, "x", " "))
		)

		self write("|\n")
	)

	self writeln(horizBorder)
	self
)
