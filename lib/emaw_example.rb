require "emaw_example/version"
require "emaw_example/emaw"
require "emaw_example/daten"
require "emaw_example/ereignis"
require "emaw_example/daten/traeger"
require "emaw_example/daten/massnahme"
require "emaw_example/daten/kunde"

require "nokogiri"

module EmawExample
  class Error < StandardError; end

  def self.root
    File.expand_path '../..', __FILE__
  end

  def self.file_path(path)
    File.join(root, path)
  end

  EXAMPLE_FILE = file_path("spec/examples/example_file.xml")
end
