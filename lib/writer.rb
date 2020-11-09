require './lib/file_manager'
require './lib/dictionary'
require './lib/translator'

class Writer
  include Translator

  attr_reader :file_manager,
              :dictionary

  def initialize
    @file_manager = FileManager.new
    @dictionary = Dictionary.new
  end

  def encode_file_to_braille
      incoming_text = file_manager.read
      encoded = encode_to_braille(incoming_text)
      file_manager.write(encoded)
  end

  def encode_to_braille(input)
    braille_by_row = build_braille_rows(input)
    output_braille(braille_by_row)
  end
end
