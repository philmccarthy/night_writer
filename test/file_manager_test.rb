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

  def test_it_writes_to_file
    file_manager = FileManager.new('writer')
    ARGV.replace ["test_in.txt", "test_out.txt"]
    assert_equal "test_out.txt", file_manager.write('0.0.0.').path
  end

  def test_it_can_count_input_characters
    file_manager = FileManager.new('writer')
    assert_equal 11, file_manager.count_characters(["hello world\n"])
  end
end
