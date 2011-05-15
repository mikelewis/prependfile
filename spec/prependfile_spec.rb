require File.dirname(__FILE__) + '/spec_helper'

describe PrependFile do
  context "Dest File is a location" do
    before do
      @file_name = "sample_files/sample.txt"
      @original_contents = File.read(@file_name)
    end

    after do
      File.open(@file_name, 'w') {|f| f.write @original_contents}
    end

    it "should prepend text to a file given a file name" do
      PrependFile.prepend(@file_name, "This is text")
      File.read(@file_name).should eq("This is text\n#{@original_contents}")
    end

    it "should prepend a file from a given file location to a file given a file name" do
      PrependFile.prepend(@file_name, "sample_files/prepend_data" )
      File.read(@file_name).should eq("#{File.read('sample_files/prepend_data')}#{@original_contents}")
    end

    it "should prepend a file from a given file object to a file given a file name" do
      PrependFile.prepend(@file_name, File.new("sample_files/prepend_data"))
      File.read(@file_name).should eq("#{File.read('sample_files/prepend_data')}#{@original_contents}")
    end

    it "should prepend a file from a given IO object to a file given a file name" do
      PrependFile.prepend(@file_name, File.open("sample_files/prepend_data", 'r'))
      File.read(@file_name).should eq("#{File.read('sample_files/prepend_data')}#{@original_contents}")
    end
  end

  context "Dest File is a File Object" do
    before do
      @file_name = "sample_files/sample.txt"
      @file = File.new @file_name
      @original_contents = @file.read
      @file.rewind
    end

    after do
      File.open(@file_name, 'w') {|f| f.write @original_contents}
    end

    it "should reach the end of the given source file" do
      PrependFile.prepend(@file, "This is text")
      @file.eof?.should eq(true)
    end

    it "should prepend text to a file object" do
      PrependFile.prepend(@file, "This is text")
      File.read(@file_name).should eq("This is text\n#{@original_contents}")
    end

    it "should prepend a file from a given file location to a file given a file name" do
      PrependFile.prepend(@file, "sample_files/prepend_data")
      File.read(@file_name).should eq("#{File.read('sample_files/prepend_data')}#{@original_contents}")
    end

    it "should prepend a file from a given file object to a file given a file name" do
      PrependFile.prepend(@file, File.new("sample_files/prepend_data"))
      File.read(@file_name).should eq("#{File.read('sample_files/prepend_data')}#{@original_contents}")
    end

    it "should prepend a file from a given IO object to a file given a file name" do
      PrependFile.prepend(@file, File.open("sample_files/prepend_data", 'r'))
      File.read(@file_name).should eq("#{File.read('sample_files/prepend_data')}#{@original_contents}")
    end

  end


  context "Dest File is a IO Object" do
    before do
      @file_name = "sample_files/sample.txt"
      @file = File.open @file_name
      @original_contents = @file.read
      @file.rewind
    end

    after do
      File.open(@file_name, 'w') {|f| f.write @original_contents}
    end

    it "should reach the end of the given source file" do
      PrependFile.prepend(@file, "This is text")
      @file.eof?.should eq(true)
    end

    it "should prepend text to a file object" do
      PrependFile.prepend(@file, "This is text")
      File.read(@file_name).should eq("This is text\n#{@original_contents}")
    end

    it "should prepend a file from a given file location to a file given a file name" do
      PrependFile.prepend(@file, "sample_files/prepend_data")
      File.read(@file_name).should eq("#{File.read('sample_files/prepend_data')}#{@original_contents}")
    end

    it "should prepend a file from a given file object to a file given a file name" do
      PrependFile.prepend(@file, File.new("sample_files/prepend_data"))
      File.read(@file_name).should eq("#{File.read('sample_files/prepend_data')}#{@original_contents}")
    end

    it "should prepend a file from a given IO object to a file given a file name" do
      PrependFile.prepend(@file, File.open("sample_files/prepend_data", 'r'))
      File.read(@file_name).should eq("#{File.read('sample_files/prepend_data')}#{@original_contents}")
    end


  end

end
