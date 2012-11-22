describe("Game", 
	it("should update all cells simultaneously",
		game := Game clone
		game board atPut(0, 0, LiveCell clone)
		game board atPut(0, 1, LiveCell clone)
		game board atPut(0, 2, LiveCell clone)

		game tick

		// Gather the cell states into a list, so we can verify them in one shot
		// (Running a jasmine matcher changes our local context and prevents 
		// further access to locals.)
		result := list(
			game board at(0, 0) isLive,
			game board at(0, 1) isLive,
			game board at(0, 2) isLive
		)

		// If the cells are updated simultaneously, the center cell will live.
		// If they're updated one at a time, they'll all die because one of the
		// center cell's neighbors will be dead before it's evaluated.
		expect(result) toEqual(list(false, true, false))
	)
)
