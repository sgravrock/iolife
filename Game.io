Game := Object clone

Game init := method(
	self board := Board clone
	self board defaultValue := DeadCell
)

Game tick := method(
	deltas := List clone

	for (x, self board minX - 1, self board maxX + 1,
		for (y, self board minY - 1, self board maxY + 1,
			cell := self board at(x, y)
			neighbors := self board neighborsOf(x, y)
			newCell := cell becomes(neighbors)
			if(newCell != cell, deltas append(list(x, y, newCell)))
		)
	)

	// Now that we know what changed, store the changes. We didn't do this as we
	// determined the changes because the state of each cell needs to be based on
	// the current generation, not what's been evaluated so far for the next one.
	for (i, 0, deltas size - 1,
		d := deltas at(i)
		self board atPut(d at(0), d at(1), d at(2))
	)

	self
)
