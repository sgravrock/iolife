LiveCell := Object clone

LiveCell isLive := true

LiveCell shouldLive := method(neighbors,
	n := 0
	neighbors foreach(it, if(it isLive, n := n + 1))
	return n > 1 and n < 4
)

LiveCell becomes := method(neighbors, 
	if (self shouldLive(neighbors), self, DeadCell)
)
