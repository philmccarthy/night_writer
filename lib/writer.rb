class Writer
  attr_reader :file_manager,
              :dictionary

  def initialize
    @file_manager = FileManager.new(self)
    @dictionary = Dictionary.new
  end

  def encode_file_to_braille
      incoming_text = file_manager.read
      encoded = encode_to_braille(incoming_text)
      file_manager.write(encoded)
  end
end
