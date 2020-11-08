require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_manager'

class FileManagerTest < Minitest::Test
  def test_it_exists_and_has_attributes
    file_manager = FileManager.new
    assert_instance_of FileManager, file_manager
  end

  def test_it_responds_to_read_and_write
    file_manager = FileManager.new
    assert_respond_to file_manager, :read
    assert_respond_to file_manager, :write
  end
end
