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

  def test_it_can_translate_latin_char_to_braille_char
    dictionary = Dictionary.new
    assert_equal ["0..00."], dictionary.translate(['o'])
    assert_equal ["0..0.."], dictionary.translate(['e'])
  end

  def test_it_can_translate_braille_to_latin_char
    dictionary = Dictionary.new
    assert_equal ['o'], dictionary.translate(["0..00."])
    assert_equal ['e'], dictionary.translate(["0..0.."])
  end

  def test_it_can_check_if_input_is_braille
    dictionary = Dictionary.new
    assert_equal true, dictionary.is_braille?("0..00.")
    assert_equal false, dictionary.is_braille?("hello")
  end
end
