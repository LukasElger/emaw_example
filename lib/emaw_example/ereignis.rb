class EmawExample::Ereignis
  require "date"
  attr_accessor :art, :datum, :ereignisid, :bemerkung

  def from_xml(xml)
    self.art = xml.css("art").text
    self.ereignisid = xml.css("ereignisid").text
    self.bemerkung = xml.css("bemerkung").text

    day = xml.css("datum").css("tag").text
    month = xml.css("datum").css("monat").text
    year = xml.css("datum").css("jahr").text

    self.datum = Date.new(year.to_i, month.to_i, day.to_i)
  end

  def to_xml(xml)
    xml.ereignis {
      xml.art self.art
        xml.datum {
          date = self.datum
          xml.tag date.day
          xml.monat date.month
          xml.jahr date.year
        }
      xml.ereignisid self.ereignisid
      xml.bemerkung self.bemerkung
    }
  end

end
