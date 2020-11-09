class Writer
  attr_reader :file_manager,
              :dictionary

  def initialize
    @file_manager = FileManager.new(self)
    @dictionary = Dictionary.new
  end

  def encode_file_to_braille
      incoming_text = file_manager.read
      encoded = encode_to_braille(incoming_text)
      file_manager.write(encoded)
  end

  def encode_to_braille(input)
    braille = dictionary.translate(input)
    top = []
    mid = []
    bot = []
    braille.each do |hex|
      top << hex.chars[0..1]
      mid << hex.chars[2..3]
      bot << hex.chars[4..5]
    end
    top = top.join
    mid = mid.join
    bot = bot.join
    final_string = []
    until top.size == 0
      final_string << "#{top.slice!(0..79)}\n"
      final_string << "#{mid.slice!(0..79)}\n"
      final_string << "#{bot.slice!(0..79)}\n"
    end
    final_string.join
  end
end
