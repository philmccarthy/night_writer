require './lib/reader'
require './lib/file_manager'
require './lib/dictionary'

reader = Reader.new
reader.decode_file_from_braille
