class Writer
  attr_reader :file_manager,
              :dictionary

  def initialize
    @file_manager = FileManager.new(self)
    @dictionary = Dictionary.new
    encode_file_to_braille
  end

  def encode_file_to_braille
      incoming_text = file_manager.read
      encoded = encode_to_braille(incoming_text)
      file_manager.write(encoded)
  end

  def encode_to_braille(input)
    braille = dictionary.translate(input)
    row1 = []
    row2 = []
    row3 = []
    braille.each do |hex|
      row1 << hex.chars[0..1]
      row2 << hex.chars[2..3]
      row3 << hex.chars[4..5]
    end
    "#{row1.join}\n#{row2.join}\n#{row3.join}"
  end
end
