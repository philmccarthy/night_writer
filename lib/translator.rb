module Translator
  def build_braille_rows(input)
    braille_rows = Hash.new { |braille_rows, line| braille_rows[line] = [] }
    braillify_english(input).each do |pair|
      braille_rows[:top] << pair.chars[0..1]
      braille_rows[:mid] << pair.chars[2..3]
      braille_rows[:btm] << pair.chars[4..5]
    end
    join_braille_rows(braille_rows)
  end

  def braillify_english(input)
    input.flat_map do |string|
      string.chomp.chars.map do |char|
        dictionary.letter_to_braille[char]
      end
    end
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
      input.keys.each do |row|
        final_string << "#{input[row].slice!(0..79)}\n"
      end
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
    braille_thirds = Hash.new { |braille_thirds, line| braille_thirds[line] = [] }
    input.each_cons(3) do |triplet|
      until triplet[0].size == 0
        braille_thirds[:top] << triplet[0].slice!(0..1)
        braille_thirds[:mid] << triplet[1].slice!(0..1)
        braille_thirds[:btm] << triplet[2].slice!(0..1)
      end
    end
    braille = braille_thirds[:top].zip(braille_thirds[:mid], braille_thirds[:btm])
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
