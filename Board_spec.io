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
	)
)
