require 'minitest/autorun'
require 'minitest/pride'
require './lib/writer'
require './lib/dictionary'
require './lib/file_manager'

class WriterTest < Minitest::Test
  def setup
    @writer = Writer.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Writer, @writer
    assert_instance_of FileManager, @writer.file_manager
  end

  def test_it_can_convert_single_letter_to_braille
    assert_equal "0.\n00\n..", @writer.encode_to_braille(['h'])
  end

  def test_it_can_convert_hello_world_to_braille
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...",
    @writer.encode_to_braille(["hello world"])
  end
end
