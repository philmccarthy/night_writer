require './test/test_helper'
require './lib/logger'

class LoggerTest < Minitest::Test
  def test_it_exists_and_can_print_confirmation
    logger = Logger.new
    assert_instance_of Logger, logger
    path = 'test.txt'
    count = 11
    logger.stubs(:puts).returns("Created #{path} containing #{11} characters")
    assert_equal "Created test.txt containing 11 characters", logger.confirmation_msg(path, count)
  end
end
