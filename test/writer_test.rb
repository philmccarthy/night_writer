require './test/test_helper.rb'
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
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", @writer.encode_to_braille(["hello world"])
  end

  def test_it_can_output_multiline_braille
    expected = "0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.\n00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0.\n....0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.\n0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00\n.0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0\n0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0..."
    assert_equal expected, @writer.encode_to_braille(["hello world hello world hello world hello world hello world hello world"])
  end

  def test_it_can_encode_file_to_braille
    ARGV.replace ["test_in.txt", "test_out.txt"]
    assert_equal "test_out.txt", @writer.encode_file_to_braille.path
  end

  def test_it_can_create_hash_of_braille_rows
    expected = {:top=>
                [["0", "."],
                 ["0", "."],
                 ["0", "."],
                 ["0", "."],
                 ["0", "."],
                 [".", "."],
                 [".", "0"],
                 ["0", "."],
                 ["0", "."],
                 ["0", "."],
                 ["0", "0"]],
               :mid=>
                [["0", "0"],
                 [".", "0"],
                 ["0", "."],
                 ["0", "."],
                 [".", "0"],
                 [".", "."],
                 ["0", "0"],
                 [".", "0"],
                 ["0", "0"],
                 ["0", "."],
                 [".", "0"]],
               :btm=>
                [[".", "."],
                 [".", "."],
                 ["0", "."],
                 ["0", "."],
                 ["0", "."],
                 [".", "."],
                 [".", "0"],
                 ["0", "."],
                 ["0", "."],
                 ["0", "."],
                 [".", "."]]}
    assert_equal expected, @writer.build_braille_rows(['hello world'])
  end

  def test_it_can_join_braille_row_arrays_to_strings
    expected = "0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00"
    @writer.join_braille_rows
  end
end
