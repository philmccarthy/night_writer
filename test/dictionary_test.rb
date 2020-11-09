require './test/test_helper.rb'
require './lib/dictionary'

class DictionaryTest < Minitest::Test
  def test_it_exists_and_has_attributes
    dictionary = Dictionary.new
    assert_instance_of Dictionary, dictionary
  end

  def test_letter_to_braille_hash
    dictionary = Dictionary.new
    assert_equal "......", dictionary.letter_to_braille[' ']
    assert_equal "0.....", dictionary.letter_to_braille['a']
    assert_equal ".00...", dictionary.letter_to_braille['i']
    assert_equal "0...00", dictionary.letter_to_braille['u']
    assert_equal "00.000", dictionary.letter_to_braille['y']
  end

  def test_it_can_braillify_single_english_characters
    dictionary = Dictionary.new
    assert_equal ["0..00."], dictionary.braillify_english(['o'])
    assert_equal ["0..0.."], dictionary.braillify_english(['e'])
  end

  def test_it_can_convert_deformatted_braille_to_english_characters
    dictionary = Dictionary.new
    arg = [
            ["0.", "00", ".."],
            ["0.", ".0", ".."],
            ["0.", "0.", "0."],
            ["0.", "0.", "0."],
            ["0.", ".0", "0."]
          ]
    assert_equal "hello", dictionary.stringify_braille(arg)
  end

  def test_it_can_invert_letter_to_braille
    dictionary = Dictionary.new
    assert_equal 'o', dictionary.braille_to_letter["0..00."]
    assert_equal 'e', dictionary.braille_to_letter["0..0.."]
  end
end
