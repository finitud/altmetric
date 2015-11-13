module Altmetric
  class ISSN
    def self.clean(issn)
      return issn if self.valid?(issn)
      clean_issn = /(\d\d\d\d).*(\d\d\d\d)/.match(issn)
      "#{clean_issn[1]}-#{clean_issn[2]}"
    end

    def self.valid?(issn)
      return /^\d\d\d\d-\d\d\d\d$/.match(issn)
    end
  end
end
