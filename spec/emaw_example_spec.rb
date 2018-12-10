RSpec.describe EmawExample do
  it {
    expect(subject.root).to include("emaw_example")
  }

  it {
    expect(subject.file_path("test.xml")).to include("emaw_example/test.xml")
  }
end
