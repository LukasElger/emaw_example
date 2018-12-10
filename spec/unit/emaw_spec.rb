RSpec.describe EmawExample::Emaw do
  subject { EmawExample::Emaw.new }

  it {
    expect(subject.ereignis).not_to be_nil
  }

  it {
    expect(subject.daten).to be_a(EmawExample::Daten)
  }

  describe "generation from xml" do
    let(:file) { EmawExample::EXAMPLE_FILE }

    before do
      subject.init_from_xml(file)
    end

    it {
      expect(subject.version).to eq("2.11")
    }

    it {
      expect(subject.daten.traeger.tcosachid).to eq("943389336162241274589407873777795072")
    }

    it {
      expect(subject.daten.massnahme.mcosachid).to eq("192505567171514883819205242977779712")
    }

    it {
      expect(subject.daten.kunde.cosachid).to eq("254941933117395748084770383868198912")
    }

    it {
      expect(subject.ereignis.ereignisid).to eq("844205595728540746789695889749311488")
    }

  end

end
