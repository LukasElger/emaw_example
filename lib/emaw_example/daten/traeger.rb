class EmawExample::Daten::Traeger

  attr_accessor :quelle, :arbeitsamtsnummer, :lfdnr,
                 :tcosachid, :name, :zusatz

  def from_xml(xml)
    self.quelle = xml.css("quelle").text
    self.arbeitsamtsnummer = xml.css("arbeitsamtsnummer").text
    self.lfdnr = xml.css("lfdnr").text
    self.tcosachid = xml.css("tcosachid").text
    self.name = xml.css("name").text
    self.zusatz = xml.css("zusatz").text
  end

  def to_xml(xml)
    xml.traeger {
      xml.traegernummer {
        xml.quelle self.quelle
        xml.arbeitsamtsnummer self.arbeitsamtsnummer
        xml.lfdnr self.lfdnr
      }
      xml.tcosachid self.tcosachid
      xml.bezeichnung {
        xml.name self.name
        xml.zusatz self.zusatz
      }
    }
  end

end
