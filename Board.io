Board := Object clone

Board init := method(
	self map := Map clone
	self minX := 0
	self minY := 0
	self maxX := 0
	self maxY := 0
)

// Set defaultValue to specify the contents of cells that are read
// before being written
Board defaultValue := nil

Board at := method(x, y,
	return (self map) at(self _keyString(x, y), self defaultValue)
)

Board atPut := method(x, y, value,
	(self map) atPut(self _keyString(x, y), value)
	self minX := self minX min(x)
	self maxX := self maxX max(x)
	self minY := self minY min(y)
	self maxY := self maxY max(y)
	return self
)

Board neighborsOf := method(x, y,
	result := List clone
	for(i, x - 1, x + 1,
		for(j, y - 1, y + 1,
			if(i != x or j != y, result append(self at(i, j)))
		)
	)
	return result
)

Board _keyString := method (x, y,
	return (x asString) .. " " .. (y asString)
)
