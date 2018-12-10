class EmawExample::Daten::Massnahme

  attr_accessor :bezeichnung, :quelle, :arbeitsamtsnummer, :lfdnr, :jahr,
                 :mcosachid, :losnummer, :losnummerlfdnr, :vergabenummer

  def from_xml(xml)
    self.bezeichnung = xml.css("bezeichnung").text
    self.quelle = xml.css("quelle").text
    self.arbeitsamtsnummer = xml.css("arbeitsamtsnummer").text
    self.lfdnr = xml.css("lfdnr").text
    self.jahr = xml.css("jahr").text
    self.mcosachid = xml.css("mcosachid").text
    self.losnummer = xml.css("losnummer").text
    self.losnummerlfdnr = xml.css("losnummerlfdnr").text
    self.vergabenummer = xml.css("vergabenummer").text
  end

  def to_xml(xml)
    xml.massnahme {
      xml.bezeichnung self.bezeichnung
      xml.massnahmenummer {
        xml.quelle self.quelle
        xml.arbeitsamtsnummer self.arbeitsamtsnummer
        xml.lfdnr self.lfdnr
        xml.jahr self.jahr
      }
      xml.mcosachid self.mcosachid
      xml.losnummer self.losnummer
      xml.losnummerlfdnr self.losnummerlfdnr
      xml.vergabenummer self.vergabenummer
    }
  end

end
