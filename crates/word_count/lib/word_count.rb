require "helix_runtime"

begin
  require "word_count/native"
rescue LoadError
  warn "Unable to load word_count/native. Please run `rake build`"
end
