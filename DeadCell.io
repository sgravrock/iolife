DeadCell := Object clone

DeadCell isLive := false

DeadCell shouldLive := method(neighbors,
   n := 0
   neighbors foreach(it, if(it isLive, n := n + 1))
   return n == 3
)
