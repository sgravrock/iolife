Board := Object clone

Board init := method(self map := Map clone)

// Set defaultValue to specify the contents of cells that are read
// before being written
Board defaultValue := nil

Board at := method(x, y,
	return (self map) at(self _keyString(x, y), self defaultValue)
)

Board atPut := method(x, y, value,
	(self map) atPut(self _keyString(x, y), value)
	return self
)

Board _keyString := method (x, y,
	return (x asString) .. " " .. (y asString)
)
