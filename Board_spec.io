describe("Board",
	it("should return the default value for a cell that hasn't been set",
		target := Board clone
		target defaultValue := 42
		expect(target at(1, 2)) toBe(42)
	),

	it("should return the set value for a cell that has been set",
		target := Board clone
		target atPut(1, 2, "foo")
		expect(target at(1, 2)) toBe("foo")
	),

	it("should provide a cell's neighbors including any that are 'off-board'",
		target := Board clone
		target defaultValue := 42
		target atPut(0, 0, "foo")
		target atPut(1, 1, "bar")
		expect (target neighborsOf(0, 0)) toBe(
			list(42, 42, 42, 42, 42, 42, 42, "bar"))
	),

	it("should initially have 0 size", 
		target := Board clone
		actual := list(target minX, target minY, target maxX, target maxY)
		expect(actual) toBe(list(0, 0, 0, 0))
	),

	it("should keep track of its size", 
		target := Board clone
		target atPut(0, -1, "x")
		target atPut(-5, 2, "x")
		target atPut(3, 0, "x")
		actual := list(target minX, target minY, target maxX, target maxY)
		expect(actual) toBe(list(-5, -1, 3, 2))
	)
)
