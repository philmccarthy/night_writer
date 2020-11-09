module Translator
  def braillify_english(input)
    input.flat_map do |string|
      string.chomp.chars.map do |char|
        dictionary.letter_to_braille[char]
      end
    end
  end

  def build_braille_rows(input)
    row_hash = Hash.new { |row_hash, line| row_hash[line] = [] }
    braillify_english(input).each do |pair|
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

  def output_braille(input)
    final_string = []
    until input[:top].empty?
      final_string << "#{input[:top].slice!(0..79)}\n"
      final_string << "#{input[:mid].slice!(0..79)}\n"
      final_string << "#{input[:btm].slice!(0..79)}\n"
    end
    final_string.join.chomp
  end

  def translate_braille(input)
    if input.is_a?(String)
      deformat_braille(input.split("\n"))
    else
      deformat_braille(input)
    end
  end

  def deformat_braille(input)
    line_hash = Hash.new { |line_hash, line| line_hash[line] = [] }
    input.each_cons(3) do |triplet|
      until triplet[0].size == 0
        line_hash[:top] << triplet[0].slice!(0..1)
        line_hash[:mid] << triplet[1].slice!(0..1)
        line_hash[:btm] << triplet[2].slice!(0..1)
      end
    end
    braille = line_hash[:top].zip(line_hash[:mid], line_hash[:btm])
    stringify_braille(braille)
  end

  def stringify_braille(input)
    collector = []
    input.each do |char_arr|
      collector << dictionary.braille_to_letter[char_arr.join]
    end
    collector.join
  end
end
