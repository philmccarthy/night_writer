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
end
