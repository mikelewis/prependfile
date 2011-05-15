f = File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__
require File.join(File.dirname(f), '..', 'lib', 'prependfile')

def run_bin(args)
  `../bin/prependfile #{args}`
end

def abs_sample_file_path(*files)
  files.map{|f| "../spec/sample_files/#{f}"}
end
