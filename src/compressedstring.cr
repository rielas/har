require "brotli"

class CompressedString
  @content : String

  def initialize(pull : JSON::PullParser)
    str = pull.read_string
    buffer = IO::Memory.new(str.size + 10)
    Compress::Brotli::Writer.open(buffer) do |br|
      br.write(str.to_slice)
    end
    @content = buffer.to_s
  end

  def initialize(str : String)
    buffer = IO::Memory.new(str.size + 10)
    Compress::Brotli::Writer.open(buffer) do |br|
      br.write(str.to_slice)
    end
    @content = buffer.to_s
  end

  def decompress
    buffer = IO::Memory.new @content
    string = Compress::Brotli::Reader.open(buffer) do |br|
      br.gets_to_end
    end
  end

  def from_json(json : JSON::PullParser)
    @content = json.read_string
  end

  def to_json(json : JSON::Builder)
    json.string @content
  end
end
