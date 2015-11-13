require 'altmetric'
require 'json'

RSpec.describe Altmetric::Document do
  let(:document) { Altmetric::Document.new }

  it 'should have a title field' do
    expect(document).to respond_to(:title)
  end

  it 'should have an authors field' do
    expect(document).to respond_to(:author)
  end

  it 'should have a journal name field' do
    expect(document).to respond_to(:journal)
  end

  it 'should have an ISSN field' do
    expect(document).to respond_to(:issn)
  end

  context 'when creating a new document' do
    it 'should provide an empty array as default authors field' do
      expect(document.author).to eq([])
    end
  end

  context 'when serialising to JSON' do
    it 'should generate valid JSON' do
      document.title = "Title"
      document.author = ["Author 1", "Author 2"]
      document.journal = "Example Journal"
      document.issn = "1234-5673"

      json = JSON.generate(document)
      expect { JSON.parse(json) }.to_not raise_error
    end
  end
end
