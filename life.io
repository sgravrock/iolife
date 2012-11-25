#!/usr/bin/env io

// Runs Conway's Game of Life after reading an initial state from a 
// specified file.
// The initial state should be a grid of spaces for dead cells and 'x's
// for live cells, for instance:
//  xx
// xx

System args size println

if(System args size != 2,
	File standardError do(
		write("Usage: " .. System args at(0) .. " input-file\n")
		write("See the samples directory for example input files.\n")
	)
	System exit(1)
)

game := Game clone
game writer := Writer clone
reader := Reader clone
inputPath := System args at(1)

if(inputPath != "-",
	reader file := File openForReading(System args at(1))
	// Otherwise use stdin, which is Reader's default.
)
reader readToBoard(game board)
game run
