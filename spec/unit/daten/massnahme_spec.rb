RSpec.describe EmawExample::Daten::Massnahme do
  subject { EmawExample::Daten::Massnahme.new }

  describe "generation from xml" do
    let(:file) { EmawExample::EXAMPLE_FILE }
    let(:xml) { Nokogiri::XML(File.open(file)) }

    before do
      subject.from_xml(xml.css("daten massnahme"))
    end

    it {
      expect(subject.bezeichnung).to eq("section_3")
    }

    it {
      expect(subject.quelle).to eq("1")
    }

    it {
      expect(subject.arbeitsamtsnummer).to eq("123")
    }

    it {
      expect(subject.lfdnr).to eq("3")
    }

    it {
      expect(subject.jahr).to eq("01")
    }

    it {
      expect(subject.mcosachid).to eq("192505567171514883819205242977779712")
    }

    it {
      expect(subject.losnummer).to eq("1")
    }

    it {
      expect(subject.losnummerlfdnr).to eq("1")
    }

    it {
      expect(subject.vergabenummer).to eq("MyString")
    }
  end

end
