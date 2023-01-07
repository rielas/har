require "spec"
require "../src/compressedstring.cr"

describe CompressedString do
  it "should compress a short string" do
    s1 = CompressedString.new "John"
    s1.decompress.should eq "John"
  end
  it "should compress a long string" do
    s1 = CompressedString.new("Developers! " * 400 + "QA!")
    s1.decompress.should eq("Developers! " * 400 + "QA!")
  end
end
