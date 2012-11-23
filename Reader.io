Reader := Object clone

Reader init := method(
	self file := File standardInput
)

Reader readToBoard := method(board,
	liveCellCode := "x" at(0)
	y := 0
	line := self file readLine

	while(line != nil,
		for(x, 0, line size,
			if(line at(x) == liveCellCode, board atPut(x, y, LiveCell))
		)
		y := y + 1
		line := self file readLine
	)

	self
)
