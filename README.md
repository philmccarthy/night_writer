# night_writer

[Night Writer](https://backend.turing.io/module1/projects/night_writer/) is my final independent project from week 6 of [Turing School](https://turing.io/)'s Mod 1 backend engineering program.

The idea of Night Writing was first developed for Napoleon’s army so soldiers could communicate silently at night without light. The concept of night writing led to Louis Braille’s development of his Braille tactile writing system. 

In this project, I implement systems for generating Braille-like text from English characters and the reverse.

### Learning Goals
* Practice breaking a program into logical components
* Testing components in isolation and in combination
* Applying Enumerable techniques in a real context
* Reading text from and writing text to files

## Class Structure
![diagramm of classes](https://i.imgur.com/lAuMed3.jpg)

* `Writer` encodes latin characters to Braille
* `Reader` decodes Braille to latin characters
* `FileManager` reads & writes files
* `Logger` has single responsibility over command-line output
* `Dictionary` contains the program's knowledge of how latin characters map to Braille and the reverse

### Module
* The `Translator` module—included in `Writer` and `Reader`—provides all methods needed to translate in either direction
