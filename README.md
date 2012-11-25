This is an implementation of Conway's Game of Life in the Io Language. To run it:

* Make sure you have Io installed. See https://github.com/stevedekorte/io for details.
* Either choose a starting point from the samples directory, or prepare your own starting point file. See the files in the samples directory for examples of the expected format.
* Run the program, passing the path to the starting point file as a command line argument:

```sh
./life.io samples/glider
```

The game will run until it's killed.

Limitations:

* I've only tried this on OS X. It should be as portable as Io itself with one exception: clearing the screen between frames. If you're on Windows, search for `system("clear")` in Writer.io and change it to `system("cls")`.
* It's pretty slow unless the grid is small.
