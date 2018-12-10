RSpec.describe EmawExample::Daten do
  subject { EmawExample::Daten.new }

  it {
    expect(subject.massnahme).not_to be_nil
  }

  it {
    expect(subject.massnahme).to be_a(EmawExample::Daten::Massnahme)
  }

  it {
    expect(subject.traeger).not_to be_nil
  }

  it {
    expect(subject.traeger).to be_a(EmawExample::Daten::Traeger)
  }

  it {
    expect(subject.kunde).not_to be_nil
  }

  it {
    expect(subject.kunde).to be_a(EmawExample::Daten::Kunde)
  }

  describe "generation from xml" do
    let(:file) { EmawExample::EXAMPLE_FILE }
    let(:xml) { Nokogiri::XML(File.open(file)) }

    before do
      subject.from_xml(xml.css("daten"))
    end

    it {
      expect(subject.traeger.tcosachid).to eq("943389336162241274589407873777795072")
    }

    it {
      expect(subject.massnahme.mcosachid).to eq("192505567171514883819205242977779712")
    }

    it {
      expect(subject.kunde.cosachid).to eq("254941933117395748084770383868198912")
    }

    it {
      expect(subject.verfahrenszweig).to eq("01")
    }

  end

end
