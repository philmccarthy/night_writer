class FileManager
  attr_reader :char_count

  def initialize(writer)
    @writer = writer
  end

  def read
    handle = File.open(ARGV[0], 'r')
    incoming_text = handle.readlines
    handle.close
    @char_count = writer.count_characters(incoming_text)
    incoming_text
  end

  def write(output)
    new_file = File.open(ARGV[1], 'w')
    new_file.write(output)
    puts "Created '#{new_file.path}' containing #{char_count} characters"
    new_file
  end
end
