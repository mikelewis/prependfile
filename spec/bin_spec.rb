require File.dirname(__FILE__) + '/spec_helper'

describe "prependfile binary" do
  before do
    @sample_files_with_content = {
      "sample_files/sample.txt" => File.read("sample_files/sample.txt"),
      "sample_files/other_sample.txt" => File.read("sample_files/other_sample.txt")
    }
  end

  after do
    @sample_files_with_content.each do |path, contents| 
      File.open(path, 'w'){|f| f.write contents}
    end
  end

  it "should accept --text argument" do
    file_path = "sample_files/sample.txt"
    run_bin "#{abs_sample_file_path("sample.txt").join} --text='hi guys'"
    File.read(file_path).should eq("hi guys\n#{@sample_files_with_content[file_path]}")
  end

  it "should accept -t argument" do
    file_path = "sample_files/sample.txt"
    run_bin "#{abs_sample_file_path("sample.txt").join} -t 'hi guys'"
    File.read(file_path).should eq("hi guys\n#{@sample_files_with_content[file_path]}")

  end

  it "should accept --file argument" do
    file_path = "sample_files/sample.txt"
    run_bin "#{abs_sample_file_path("sample.txt").join} --file=#{abs_sample_file_path("prepend_data").join}"
    File.read(file_path).should eq("#{File.read('sample_files/prepend_data')}#{@sample_files_with_content[file_path]}")
  end

  it "should accept -f argument" do
        file_path = "sample_files/sample.txt"
    run_bin "#{abs_sample_file_path("sample.txt").join} -f #{abs_sample_file_path("prepend_data").join}"
    File.read(file_path).should eq("#{File.read('sample_files/prepend_data')}#{@sample_files_with_content[file_path]}")

  end

  it "should accept STDIN" do
    file_path = "sample_files/sample.txt"
    run_bin "#{abs_sample_file_path("sample.txt").join} < #{abs_sample_file_path("prepend_data").join}"
    File.read(file_path).should eq("#{File.read('sample_files/prepend_data')}#{@sample_files_with_content[file_path]}")
  end

  it "should accept multiple files as input" do
    run_bin "#{abs_sample_file_path("sample.txt","other_sample.txt").join(" ")} --text='hi guys'"
    @sample_files_with_content.each do |path, content|
      File.read(path).should eq("hi guys\n#{content}")
    end
  end

  it "should not accept zero files" do
    run_bin(" 2> /dev/null")
    $?.success?.should eq(false)
  end

  it "should not accept zero files and give a stderror message" do
    run_bin(" 2>&1").should match(/need to give a file to prepend to/)
  end

  it "should not accept a none existant --file" do
    run_bin("--file=blahblah 2> /dev/null")
    $?.success?.should eq(false)
  end

  it "should not accept a none existant --file and give a stderror message" do
    run_bin("--file=blahblah 2>&1").should match(/Error: need to give a file to prepend to/)
  end

  it "should not accept a directory for --file" do
    run_bin("--file=/dev 2> /dev/null")
    $?.success?.should eq(false)
  end
  
  it "should not accept a none existant --file and give a stderror message" do
    run_bin("--file=/dev 2>&1").should match(/Error: need to give a file to prepend to/)
  end
end
