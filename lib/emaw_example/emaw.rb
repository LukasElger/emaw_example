class EmawExample::Emaw
  require "nokogiri"

  attr_accessor :version, :daten, :ereignis

  def initialize
    self.ereignis = EmawExample::Ereignis.new
    self.daten = EmawExample::Daten.new
  end

  def init_from_xml(file_path)
    xml = Nokogiri::XML(File.open(file_path))
    from_xml(xml.css("emaw"))
  end

  def from_xml(xml)
    self.version = xml.css("version").text

    daten.from_xml(xml.css("daten"))
    ereignis.from_xml(xml.css("ereignis"))
  end

  def build_xml
    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      to_xml(xml)
    end

    builder.to_xml
  end

  def to_xml(xml)
    xml.send("emaw", xmlns: "http://ba.emaw.types") {
      xml.version self.version
      self.daten.to_xml(xml)
      self.ereignis.to_xml(xml)
    }
  end

end
