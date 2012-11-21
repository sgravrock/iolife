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

describe("toHaveBeenCalled matcher", 
	it("should succeed if the spy was called",
		spiedOn := Object clone
		spy := spyOn(spiedOn, "foo")
		spiedOn foo
		matcher := expect(spy) toHaveBeenCalled
		expect(matcher success) toBe(true)
	),

	it("should fail if the spy wasn't called",
		spiedOn := Object clone
		spy := spyOn(spiedOn, "foo")
		ex := try(expect(spy) toHaveBeenCalled)
		expect(ex error) toBe("Expected spy to have been called")
	)
)

describe("toHaveBeenCalledWith matcher",
	it("should succeed if the spy was called with the right arguments",
		spiedOn := Object clone
		spy := spyOn(spiedOn, "foo")
		spiedOn foo("a", 5)
		matcher := expect(spy) toHaveBeenCalledWith("a", 5)
		expect(matcher success) toBe(true)
	),

	it("should fail if the spy wasn't called",
		spiedOn := Object clone
		spy := spyOn(spiedOn, "foo")
		ex := try(expect(spy) toHaveBeenCalledWith(42))
		expect(ex error) toBe("Expected spy to have been called with list(42) but it wasn't called.")
	),

	it("should fail if the spy was called with the wrong arguments",
		spiedOn := Object clone
		spy := spyOn(spiedOn, "foo")
		spiedOn foo("a", 5)
		ex := try(expect(spy) toHaveBeenCalledWith(42))
		expect(ex error) toBe("Expected spy to have been called with list(42) but it was called with list(a, 5).")
	)
)
