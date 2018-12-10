class EmawExample::Daten::Kunde

  attr_accessor :kundennummer, :cosachid, :name,
                 :vorname, :geschlecht, :arbeitsamtsnummer

  def from_xml(xml)
    self.kundennummer = xml.css("kundennummer").text
    self.cosachid = xml.css("cosachid").text
    self.name = xml.css("name").text
    self.vorname = xml.css("vorname").text
    self.geschlecht = xml.css("geschlecht").text
    self.arbeitsamtsnummer = xml.css("arbeitsamtsnummer").text
  end

  def to_xml(xml)
    xml.kunde {
      xml.kundennummer self.kundennummer
      xml.cosachid self.cosachid
      xml.name self.name
      xml.vorname self.vorname
      xml.geschlecht self.geschlecht
      xml.arbeitsamtsnummer self.arbeitsamtsnummer
    }
  end

end
