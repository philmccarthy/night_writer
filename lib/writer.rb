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
    file_manager.write(encode_to_braille(file_manager.read))
  end

  def encode_to_braille(input)
    output_braille(build_braille_rows(input))
  end
end
