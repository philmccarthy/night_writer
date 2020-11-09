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

  def build_braille_rows(input)
    row_hash = Hash.new { |row_hash, line| row_hash[line] = [] }
    dictionary.braillify_english(input).each do |pair|
      row_hash[:top] << pair.chars[0..1]
      row_hash[:mid] << pair.chars[2..3]
      row_hash[:btm] << pair.chars[4..5]
    end
    join_braille_rows(row_hash)
  end

  def join_braille_rows(input)
    input.keys.each do |row|
      input[row] = input[row].join
    end
    input
  end

  def encode_to_braille(input)
    braille_by_row = build_braille_rows(input)
    require "pry"; binding.pry
    # braille = dictionary.braillify_english(input)
    # row_hash = Hash.new { |row_hash, line| row_hash[line] = [] }
    # braille.each do |pair|
    #   row_hash[:top] << pair.chars[0..1]
    #   row_hash[:mid] << pair.chars[2..3]
    #   row_hash[:btm] << pair.chars[4..5]
    # end
    final_string = []
    until row_hash[:top].empty?
      final_string << "#{row_hash[:top].slice!(0..79)}\n"
      final_string << "#{row_hash[:mid].slice!(0..79)}\n"
      final_string << "#{row_hash[:btm].slice!(0..79)}\n"
    end
    final_string.join.chomp
  end
end
