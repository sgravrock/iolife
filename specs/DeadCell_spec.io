describe("DeadCell",
	it("should not be live",
		target := DeadCell clone
		expect(target isLive) toBe(false)
	),

	it("should stay dead if fewer than 3 neighbors are live",
		target := DeadCell clone
		neighbors := list(DeadCell clone,
			DeadCell clone,
			LiveCell clone,
			LiveCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone
		)
		expect(target shouldLive(neighbors)) toBe(false)
	),

	it("should become alive if 3 neighbors are live",
		target := DeadCell clone
		neighbors := list(DeadCell clone,
			DeadCell clone,
			LiveCell clone,
			LiveCell clone,
			DeadCell clone,
			DeadCell clone,
			DeadCell clone,
			LiveCell clone
		)
		expect(target shouldLive(neighbors)) toBe(true)
	),

	it("should stay dead if more than 3 neighbors are live",
		target := DeadCell clone
		neighbors := list(DeadCell clone,
			DeadCell clone,
			LiveCell clone,
			LiveCell clone,
			DeadCell clone,
			LiveCell clone,
			DeadCell clone,
			LiveCell clone
		)
		expect(target shouldLive(neighbors)) toBe(false)
	)
)
