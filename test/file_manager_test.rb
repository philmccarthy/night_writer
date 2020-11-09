require './test/test_helper.rb'
require './lib/file_manager'

class FileManagerTest < Minitest::Test
  def test_it_exists_and_has_attributes
    file_manager = FileManager.new('writer')
    assert_instance_of FileManager, file_manager
  end

  def test_it_reads_text_from_file
    file_manager = FileManager.new('writer')
    File.stubs(:readlines).returns("some text")
    assert_equal "some text", file_manager.read
  end
end
