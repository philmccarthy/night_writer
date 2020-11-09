require './lib/writer'
require './lib/file_manager'
require './lib/dictionary'

writer = Writer.new
writer.encode_file_to_braille
