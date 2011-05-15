require 'fileutils'
require 'tempfile'

module PrependFile
  class << self
    def prepend(old_file, data)
      temp_file = Tempfile.open('prependfile')
      begin
        #prepend data
        write_to_temp(temp_file, data)
        #write old file to temp
        write_to_temp(temp_file, old_file)
        #move temp file to original location
        move_temp_to_original(temp_file, old_file)
      ensure
        temp_file.close
        temp_file.unlink
      end
    end

    private

    def move_temp_to_original(temp, original)
      original = original.path unless original.is_a?(String)
      FileUtils.mv(temp.path, original)
    end

    def write_to_temp(temp_file, data)
      if data.is_a?(IO) || data.is_a?(File)
        temp_file.write data.read
      elsif data.is_a?(String)
        if File.file?(data)
          temp_file.write File.read(data)
        else
          temp_file.puts data.to_s
        end
      end
    end
  end

end
