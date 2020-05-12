= 9e
9e is a program to explode Third Edition Plan 9 and at least some Inferno archives. It has been tested under Digital UNIX 4.0, but should work under most Unices and even MS-DOS. You can do whatever you like with the source so long as you clearly indicate all modifications and the author responsible for each.

## Usage Summary

`$9e [options] <file> ...`

If no file is named on the command line, standard input is assumed. Note that the input file must be a decompressed archive (decompress with gzip).

* -h: dump headers only
* -v: dump file names and sizes while extracting
* -r: specify alternate root directory
* -?: help
