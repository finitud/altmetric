require 'altmetric'

RSpec.describe Altmetric::Document do
  let(:document) { Altmetric::Document.new }

  it 'should have a title field' do
    expect(document).to respond_to(:title)
  end

  it 'should have an authors field' do
    expect(document).to respond_to(:authors)
  end

  it 'should have a journal name field' do
    expect(document).to respond_to(:journal)
  end

  it 'should have an ISSN field' do
    expect(document).to respond_to(:issn)
  end

  context 'when creating a new document' do
    it 'should provide an empty array as default authors field' do
      expect(document.authors).to eq([])
    end
  end
end
