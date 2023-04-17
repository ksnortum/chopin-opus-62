# chopin-opus-62
LilyPond source files for Chopin's Two Nocturnes, Opus 62.

## Requirements
LilyPond version 2.24.1 or higher.  It is assumed that `lilypond` is in the PATH of your system.

## Producing PDFs or other outputs
You can find the latest release of the PDF and MIDI files [here](https://github.com/ksnortum/chopin-opus-62/releases/latest), otherwise `cd` into your installation directory and type:

        lilypond two-nocturnes-op62-book.ly

This should produce a PDF and two MIDI files.

The PDF produced will have point-and-click info in it, which you may not want (it makes the file size much bigger).  To avoid this use the `-dno-point-and-click` command line option, or uncomment `\pointAndClickOff` in the file `two-nocturnes-op62-book.ly`.  Command line options are explained in detail [here](https://lilypond.org/doc/v2.24/Documentation/usage/command_002dline-usage).

## Paper Size
This project was written assuming a paper size of "letter".  It will also work with a paper size of "a4" with a few adjustments.

* The only necessary change is that you comment out the follow line in `includes/header-paper.ily`:

        \#(set-paper-size "letter")

* Next, move the first forte indication a little to the left.  You can do this by changing -2.5 to -3.5 in the following line in the file `includes/nocturnes-op62-book.ily`:

        s4\tweak X-offset -2.5 \f s s s s\> s s s s1


## Licensing
This work is licensed under CC BY-SA 4.0. To view a copy of this license, visit [http://creativecommons.org/licenses/by-sa/4.0/](http://creativecommons.org/licenses/by-sa/4.0/).

## Questions, problems, etc.
If you have a question about these source files or how to produce a PDF, you can contact me at: **knute (at) snortum (dot) net**
