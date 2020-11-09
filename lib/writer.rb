class Writer
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
    braille = dictionary.braillify_english(input)
    top = []
    mid = []
    btm = []
    braille.each do |hex|
      top << hex.chars[0..1]
      mid << hex.chars[2..3]
      btm << hex.chars[4..5]
    end
    top = top.join
    mid = mid.join
    btm = btm.join
    final_string = []
    until top.empty?
      final_string << "#{top.slice!(0..79)}\n"
      final_string << "#{mid.slice!(0..79)}\n"
      final_string << "#{btm.slice!(0..79)}\n"
    end
    final_string.join.chomp
  end
end
