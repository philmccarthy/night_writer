require './lib/file_manager'
require './lib/dictionary'

class Reader
  attr_reader :file_manager,
              :dictionary

  def initialize
    @file_manager = FileManager.new
    @dictionary = Dictionary.new
  end

  def decode_file_from_braille
    incoming_text = file_manager.read
    decoded = decode_from_braille(incoming_text)
    file_manager.write(decoded)
  end

  def decode_from_braille(input)
    standardize_format(input)
  end

  def standardize_format(input)
    if input.is_a?(String)
      deformat_braille(input.split("\n"))
    else
      deformat_braille(input)
    end
  end

  def deformat_braille(input)
    line1 = []
    line2 = []
    line3 = []
    input.each_cons(3) do |triplet|
      # triplet.each do |line|
      #   line.chomp!
      # end
      until triplet[0].size == 0
        line1 << triplet[0].slice!(0..1)
        line2 << triplet[1].slice!(0..1)
        line3 << triplet[2].slice!(0..1)
      end
    end
    dictionary.stringify_braille(line1.zip(line2, line3))
  end
end
