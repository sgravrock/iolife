MockInputFile := Object clone
MockInputFile init := method(
	inputLines := list()
)

MockInputFile readLine := method(
	if(self inputLines size > 0,
		self inputLines removeFirst,
		nil
	)
)


describe("Reader",
	it("should set up the board with the specified configuration",
		r := Reader clone
		r file := MockInputFile clone
		r file inputLines := list(
			"  xx ",
			" xx  "
		)
		b := Board clone
		r readToBoard(b)

		// The most convenient way to verify the board is to write it back out.
		w := WriterForSpec clone
		w writeBoard(b)
		expect(w textWritten) toEqual("+----+\n|  xx|\n| xx |\n+----+\n")
	)
)
