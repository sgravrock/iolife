Writer := Object clone
Writer clearBetweenWrites := true
Writer showBorder := false
Writer showGeneration := true
Writer generation := 0

Writer writeBoard := method(board,
	// Clear the screen if configured to do so.
	// Only works on Unix-y systems.
	if(self clearBetweenWrites, System system("clear"))

	self generation = self generation + 1
	if(self showGeneration, self writeln(self generation))

	if(self showBorder,
		horizBorder := "+"
	
		for (i, board minX, board maxX,
			horizBorder = horizBorder .. "-")
		
		horizBorder = horizBorder .. "+"
		self writeln(horizBorder)
	)

	for(i, board minY, board maxY, 
		if(self showBorder, self write("|"))
		for(j, board minX, board maxX,
			cell := board at(j, i)
			self write(if(cell isLive, "x", " "))
		)

		if(self showBorder, self write("|"))
		self write("\n")
	)

	if(self showBorder, self writeln(horizBorder))
	self
)
