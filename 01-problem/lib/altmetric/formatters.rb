require 'json'
require 'csv'

module Altmetric
  AVAILABLE_FORMATTERS = {
    json: ->(data) { JSON.generate(data) },
    csv: ->(data) {
      CSV.generate do |csv|
        csv << ["DOI","Title","Author","Journal","ISSN"]
        data.each do |doi, record|
          csv << [doi, record.title, record.author.join(", "), record.journal, record.issn]
        end
      end
    }
  }
end
