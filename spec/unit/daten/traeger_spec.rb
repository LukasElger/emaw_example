RSpec.describe EmawExample::Daten::Traeger do
  subject { EmawExample::Daten::Traeger.new }

  describe "generation from xml" do
    let(:file) { EmawExample::EXAMPLE_FILE }
    let(:xml) { Nokogiri::XML(File.open(file)) }

    before do
      subject.from_xml(xml.css("daten traeger"))
    end

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
      expect(subject.tcosachid).to eq("943389336162241274589407873777795072")
    }

    it {
      expect(subject.name).to eq("MyString")
    }

    it {
      expect(subject.zusatz).to eq("MyString")
    }
  end

end
