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
	)
)
