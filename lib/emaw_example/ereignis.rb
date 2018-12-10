class EmawExample::Ereignis
  require "date"
  attr_accessor :art, :datum, :ereignisid

  def from_xml(xml)
    self.art = xml.css("art").text
    self.ereignisid = xml.css("ereignisid").text

    day = xml.css("datum").css("tag").text
    month = xml.css("datum").css("monat").text
    year = xml.css("datum").css("jahr").text

    self.datum = Date.new(year.to_i, month.to_i, day.to_i)
  end

  def to_xml(xml)
    xml.ereignis {
      xml.art self.art
      if datum.present?
        xml.datum {
          date = self.datum
          xml.tag date.day
          xml.monat date.month
          xml.jahr date.year
        }
      end
      xml.ereignisid self.ereignisid
    }
  end

end
