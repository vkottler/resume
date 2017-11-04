# My Resume

Source assets for my LaTeX resume.

This project was started from scratch with no outside templating  
as far as directory and Makefile structure.

## Development Environment & Dependencies

Currently this project can be built and developed on in Ubuntu GNOME  
16.04 LTS and Windows 10.

* [Ubuntu GNOME](https://ubuntugnome.org/) 16.04 LTS
  * `make` - Package, runs commands necessary to build project
  * `latex` - Package, compile `*.tex` into `*.dvi`
  * `pdflatex` - Package, compile `*.tex` directly into `*.pdf`
  * `xdvi` - Package, view raw `*.dvi` files
  * `dvipng` - Package, convert `*.dvi` into a PNG file
  * `evince` - PDF Viewer (GNOME Default)
  * `eog` - Image Viewer (GNOME Default)
* [Windows 10](https://en.wikipedia.org/wiki/Antichrist) Version 1703
  * `make` - [GnuWin32](http://gnuwin32.sourceforge.net/packages/make.htm)
  * `*tex*` - [texlive](http://www.tug.org/texlive/)
  * [Adobe Acrobat Reader](https://get.adobe.com/reader/)

## Usage (See [Makefile](Makefile))

* `make pdf` - compiles the current source into a PDF
* `make png` - compiles the current source into a PNG
* `make clean` - removes all intermediate files and artifacts
* `make all` - execute `pdf` and `png`

## Limitations

### Windows

It is currently not possible to open the image output file or dvi  
output file without additional third-party software.

### Linux

Everything works.

## Latest Snapshot

![Resume](main.png)

