WriterForSpec := Writer clone
WriterForSpec clearBetweenWrites := false

WriterForSpec init := method(
	super(init)
	self textWritten := ""
)

WriterForSpec write := method(arg,
	self textWritten = self textWritten .. arg
)

WriterForSpec writeln := method(arg,
	if(arg != nil, self write(arg))
	self write("\n")
)

describe("Writer",
	it("should write the board's state",
		target := WriterForSpec clone
		board := Board clone
		board defaultValue := DeadCell
		board atPut(0, 0, LiveCell)
		board atPut(1, 1, LiveCell)
		target writeBoard(board)
		expect(target textWritten) toEqual("+--+\n|x |\n| x|\n+--+\n")
	),

	it("should expand the board as needed",
		target := WriterForSpec clone
		board := Board clone
		board defaultValue := DeadCell
		board atPut(0, 0, LiveCell)
		target writeBoard(board)
		target textWritten = ""
		board atPut(-2, -2, LiveCell)
		board atPut(2, 2, LiveCell)
		target writeBoard(board)
		expect(target textWritten) toEqual("+-----+\n|x    |\n|     |\n|  x  |\n|     |\n|    x|\n+-----+\n")
	)
)
