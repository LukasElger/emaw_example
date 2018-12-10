RSpec.describe EmawExample::Ereignis do
  subject { EmawExample::Ereignis.new }

  describe "generation from xml" do
    let(:file) { EmawExample::EXAMPLE_FILE }
    let(:xml) { Nokogiri::XML(File.open(file)) }

    before do
      subject.from_xml(xml.css("ereignis"))
    end

    it {
      expect(subject.art).to eq("RueckmeldungKontakt")
    }

    it {
      expect(subject.datum.to_s).to eq("2018-11-19")
    }

    it {
      expect(subject.ereignisid).to eq("844205595728540746789695889749311488")
    }

  end

end
