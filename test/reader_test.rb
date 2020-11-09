require './test/test_helper'
require './lib/reader'
require './lib/file_manager'
require './lib/dictionary'

class ReaderTest < Minitest::Test
  def setup
    @reader = Reader.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Reader, @reader
    assert_instance_of FileManager, @reader.file_manager
    assert_instance_of Dictionary, @reader.dictionary
  end

  def test_it_can_deformat_short_braille
    assert_equal "hello world", @reader.decode_from_braille("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...")
  end

  def test_it_can_decode_file_from_braille
    skip
  end

  def test_it_can_decode_from_braille
    skip
  end
end
