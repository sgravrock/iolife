#!/usr/bin/env io

// Runs Conway's Game of Life after reading an initial state from stdin.
// The initial state should be a grid of spaces for dead cells and 'x's
// for live cells, for instance:
//  xx
// xx

game := Game clone
game writer := Writer clone
Reader clone readToBoard(game board)
game run

