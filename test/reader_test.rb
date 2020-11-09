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
end
