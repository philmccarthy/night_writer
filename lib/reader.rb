require './lib/file_manager'
require './lib/dictionary'
require './lib/translator'

class Reader
  include Translator

  attr_reader :file_manager,
              :dictionary

  def initialize
    @file_manager = FileManager.new
    @dictionary = Dictionary.new
  end

  def decode_file_from_braille
    decoded = decode_from_braille(file_manager.read)
    file_manager.write(decoded)
  end

  def decode_from_braille(input)
    translate_braille(input)
  end
end
