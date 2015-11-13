require 'altmetric'

RSpec.describe Altmetric::ISSN do
  context '.clean' do
    it 'is provided as a class method' do
      expect(Altmetric::ISSN).to respond_to(:clean)
    end

    it 'cleans up a ISSN given with no dash' do
      clean_issn = Altmetric::ISSN.clean("12345678")
      expect(clean_issn).to eq("1234-5678")
    end

    it 'does not modify a well formed ISSN' do
      clean_issn = Altmetric::ISSN.clean("1234-5678")
      expect(clean_issn).to eq("1234-5678")
    end
  end

  context '.valid?' do
    it 'is provided as a class method' do
      expect(Altmetric::ISSN).to respond_to(:valid?)
    end

    it 'should return true when given a well formed ISSN' do
      expect(Altmetric::ISSN.valid?("1234-5678")).to be_truthy
    end

      it 'should return false when given an ill formed ISSN' do
        expect(Altmetric::ISSN.valid?("12345678")).to be_falsy
        expect(Altmetric::ISSN.valid?("1234-56789")).to be_falsy
    end
end
end
