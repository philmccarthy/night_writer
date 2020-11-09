require './test/test_helper'
require './lib/logger'

class LoggerTest < Minitest::Test
  def test_it_exists_and_can_print_confirmation
    logger = Logger.new
    logger.stubs(:puts).returns("Created text.txt containing 11 characters")
    assert_equal "Created text.txt containing 11 characters", logger.confirmation_msg('text.txt', 11)
  end
end
