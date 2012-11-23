// Mock Writer for use in specs

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
