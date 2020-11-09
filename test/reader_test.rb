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

  def test_it_can_flow_through_standardize_format
    expected = "hello world"
    arg = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    assert_equal expected, @reader.standardize_format(arg)
    arg = ["0.0.0.0.0....00.0.0.00", "00.00.0..0..00.0000..0", "....0.0.0....00.0.0..."]
    assert_equal expected, @reader.standardize_format(arg)
  end

  def test_it_can_deformat_braille
    arg = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    assert_equal "hello world", @reader.decode_from_braille(arg)
    arg = ["0.0.0.0.0....00.0.0.00", "00.00.0..0..00.0000..0", "....0.0.0....00.0.0..."]
    assert_equal "hello world", @reader.decode_from_braille(arg)
  end

  def test_it_can_decode_from_long_braille
    arg = ["0.0.0.0.0...000.0.0.000..0.0..0000..0.0.00..000..00.0000...00.0...000.000....00.\n",
           "00.00.0..0...0..00...0.00.0......0...00..0..0.000..0.0.0..0.0..0.....0...0..00.0\n",
           "....0.0.0.......0.0.0...0.0...0.00..0.0.......0.....0.......00......0.0.....0.0.\n",
           "...00.0.0....0.0.00...000.0...0.000..000..0.0.000.0..00...0...0..0.0.00.00...00.\n",
           "..00..0.....000.0000...0.0......00..0..0..0..0......0..0......0.0.0.0..0.0..0..0\n",
           "..0...0.0....0..0.....000.00..........0...........000.........00..0...0.0...0.0.\n",
           "00.00.00..000.0.0.00.00000..0.0.00.0...0.0.0...00.0.00.0...00..00.0....0...00..0\n",
           "0.000..0....00.0.00.0..000..0..00.00..0.000...0..0.0.00...00000.0..0..0...00..0.\n",
           "..0.0.00....0.....0...0.....0.....0.....0.0...0.......0....0....0..........0..0.\n",
           "...00.0.0.00.00000..0.0000...00.0...0..0.0.00.00...00.0..0...00..0..000.0.00.00.\n",
           "..0.0..0.00.0..000.....0.0..0000.0..0.0.0.0..0.0..0000..00..00..0...0.0....000.0\n",
           "..0.0.....0...0.......0.....0.......00..0...0.0...0.....0....0..0...0.0...0.0...\n",
           "00...000..0000..0.0.0..000...0.0.00.0...0.0.000..000.0...0.0.00..000...00.0....0\n",
           ".0..0..0.....0..0.00..0..0..0.000.0.0...00.0....0..00...000.00000..0..0000.0..0.\n",
           "......0...0.00....0.....0...0.0...0.0...0...0.....0.0....0..0.....0...0.......0.\n",
           "0.0.0000..0.00...0.00.0.00000.\n",
           ".0...0.0...00...0.0.0..0.0...0\n",
           "0.000.....0.....0...0...0....."]
    expected = "hello darkness my old friend ive come to talk with you again because a vision softly creeping left its seeds while i was sleeping and the vision that was planted in my brain still remains within the sound of silence"
    assert_equal expected, @reader.decode_from_braille(arg)
  end

  def test_it_can_decode_file_to_english
    ARGV.replace ["test_song.txt", "test_song_out.txt"]
    assert_equal "test_song_out.txt", @reader.decode_file_from_braille.path
  end
end
