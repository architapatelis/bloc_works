# this method converts the string LabelsController into  labels_controller.
# We'll call this method from lib/bloc_works/dependencies.rb, in a method called const_missing
module BlocWorks
  def self.snake_case(camel_cased_word)
    string = camel_cased_word.gsub(/::/, '/')
    string.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
    string.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    string.tr!("-", "_")
    string.downcase
  end
end
