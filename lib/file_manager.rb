require './lib/logger'

class FileManager
  attr_reader :char_count,
              :logger

  def initialize
    @logger = Logger.new
  end

  def read
    incoming_text = File.readlines(ARGV[0])
    @char_count = count_characters(incoming_text)
    incoming_text
  end

  def write(output)
    new_file = File.open(ARGV[1], 'w')
    new_file.write(output)
    logger.confirmation_msg(new_file.path, char_count)
    new_file
  end

  def count_characters(input)
    input.sum do |line|
      line.chomp.size
    end
  end
end
