require './lib/file_manager'
require './lib/dictionary'

class Reader
  attr_reader :file_manager,
              :dictionary

  def initialize
    @file_manager = FileManager.new
    @dictionary = Dictionary.new
  end
end
