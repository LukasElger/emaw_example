RSpec.describe EmawExample::Daten::Kunde do
  subject { EmawExample::Daten::Kunde.new }

  describe "generation from xml" do
    let(:file) { EmawExample::EXAMPLE_FILE }
    let(:xml) { Nokogiri::XML(File.open(file)) }

    before do
      subject.from_xml(xml.css("daten kunde"))
    end

    it {
      expect(subject.kundennummer).to eq("103B100003")
    }

    it {
      expect(subject.cosachid).to eq("254941933117395748084770383868198912")
    }

    it {
      expect(subject.name).to eq("section_3")
    }

    it {
      expect(subject.vorname).to eq("MyString")
    }

    it {
      expect(subject.geschlecht).to eq("M")
    }

    it {
      expect(subject.arbeitsamtsnummer).to eq("123")
    }

  end

end
