PrependFile
=============

Due to the fact that most file systems do not support prepend operations, I decided to create a simple gem to do just that.


##Usage

### Command Line

    Usage:
       prependfile [options] target_file

    Examples:
      
      prependfile file.cpp --text="PUT THIS ON TOP"

      prependfile file.cpp main.cpp test.cpp --text="This goes on all of them!"

      prependfile *.cpp --file=banner.txt

      prependfile *.rb (this will put you into STDIN)

      prependfile *.rb < banner.txt

    where [options] are:
      --text, -t <s>:   Text to prepend to file
      --file, -f <s>:   Contents of file to prepend to the dest file
       --version, -v:   Print version and exit
      --help, -h:   Show this message


### Ruby Code  

  **General**

    require 'prependfile'
    
    PrependFile.prepend(<file_to_append>, <text_to_prepend>)

  `<file_to_append>` and `<text_to_prepend>` can be a filename(String), File Object, or IO Object


  **Examples**

    PrependFile.prepend("sample.txt", "I want this text to be on the top!")

    PrependFile.prepend("sample.txt", File.new("file_that_contains_header.txt"))

    PrependFile.prepend("sample.txt", "file_that_contains_header.txt")

    PrependFile.prepend(File.new("sample.txt"), "I want this text to be on the top!")

   To see all examples/cases, see the spec file.
