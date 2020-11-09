class FileManager
  attr_reader :char_count,
              :writer

  def initialize(writer)
    @writer = writer
  end

  def read
    incoming_text = File.readlines(ARGV[0])
    @char_count = count_characters(incoming_text)
    incoming_text
  end

  def write(output)
    new_file = File.open(ARGV[1], 'w')
    new_file.write(output)
    puts "Created '#{new_file.path}' containing #{char_count} characters"
    new_file
  end

  def count_characters(input)
    input.sum do |line|
      line.chomp.size
    end
  end
end
