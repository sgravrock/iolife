describe("LiveCell",
	it("should be live",
		target := LiveCell clone
		expect(target isLive) toBe(true)
	),

	it("should stay alive if 2-3 neighbors are alive", 
		target := LiveCell clone
		neighbors := list(LiveCell clone,
			DeadCell clone,
			LiveCell clone,
			LiveCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone
		)
		expect(target shouldLive(neighbors)) toBe(true)
	),

	it("should die if fewer than 2 neighbors are alive",
		target := LiveCell clone
		neighbors := list(LiveCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone
		)
		expect(target shouldLive(neighbors)) toBe(false)
	),

	it("should die if more than 3 neighbors are alive",
		target := LiveCell clone
		neighbors := list(LiveCell clone,
			DeadCell clone,
			DeadCell clone,
			LiveCell clone,
			LiveCell clone,
			LiveCell clone,
			DeadCell clone,
			DeadCell clone
		)
		expect(target shouldLive(neighbors)) toBe(false)
	)
)
