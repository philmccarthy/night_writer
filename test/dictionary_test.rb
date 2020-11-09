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

  def test_it_can_invert_letter_to_braille
    dictionary = Dictionary.new
    assert_equal 'o', dictionary.braille_to_letter["0..00."]
    assert_equal 'e', dictionary.braille_to_letter["0..0.."]
  end
end
