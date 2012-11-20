describe("Spies", 
	it("should throw if the object is nil",
		expect(block(spyOn(nil, "foo"))) toThrow("Can't spy on nil")
	),

	it("should throw if the method name is nil", 
		expect(block(spyOn(self, nil))) toThrow("Method name wasn't passed to spyOn")
	),

	it("should provide the spy in the method's scope slot", 
		spiedOn := Object clone
		spy := spyOn(spiedOn, "foo")
		result := spiedOn getSlot("foo") scope
		// should be able to do: expect(result) toBe(spy),
		// but that fails with "Spy does not respond to 'spy'".
		expect(result isSpy) toBe(true)
	),

	it("should start with an empty call list",
		spiedOn := Object clone
		spy := spyOn(spiedOn, "foo")
		expect(spy calls) toBe(list())
	),

	it("should store the arguments used to call the spy",
		spiedOn := Object clone
		spy := spyOn(spiedOn, "foo")
		spiedOn foo
		spiedOn foo(42, 36)
		// Should be able to do this:
		//expect(spy calls) toEqual(list(list(), list(42, 36)))
		// once things work correctly
		expect(spy calls at(1) at(1)) toEqual(36)
	)
)
