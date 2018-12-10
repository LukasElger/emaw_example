class EmawExample::Daten

  attr_accessor :traeger, :massnahme, :kunde, :verfahrenszweig

  def initialize
    self.traeger = EmawExample::Daten::Traeger.new
    self.massnahme = EmawExample::Daten::Massnahme.new
    self.kunde = EmawExample::Daten::Kunde.new
  end

  def from_xml(xml)
    traeger.from_xml(xml.css("traeger"))
    massnahme.from_xml(xml.css("massnahme"))
    kunde.from_xml(xml.css("kunde"))

    self.verfahrenszweig = xml.css("verfahrenszweig").text
  end

  def to_xml(xml)
    xml.daten {
      self.traeger.to_xml(xml)
      self.massnahme.to_xml(xml)
      self.kunde.to_xml(xml)
      xml.verfahrenszweig self.verfahrenszweig
    }
  end

end
