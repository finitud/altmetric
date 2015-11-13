require 'altmetric/document'
require 'altmetric/issn'

require 'csv'
require 'json'

module Altmetric
  class DataParser
    attr_accessor :journal_data, :article_data, :author_data, :data, :journals

    def initialize(options)
      @journal_data = options.fetch(:journal_data)
      @article_data = options.fetch(:article_data)
      @author_data = options.fetch(:author_data)
      @data = {}
      @journals = {}
    end

    def parse_articles
      article_data.each do |row|
        doi, title, issn = row
        data[doi] = Altmetric::Document.new
        data[doi].title = title
        data[doi].issn = Altmetric::ISSN.clean(issn)
      end
    end

    def parse_journals
      journal_data.each do |row|
        journal, dirty_issn = row
        issn = Altmetric::ISSN.clean(dirty_issn)
        journals[issn] = journal
      end
    end

    def parse_authors
      author_data.each do |author|
        name = author["name"]
        dois = author["articles"]

        dois.each { |doi| data[doi].author << name }
      end
    end

    def parse
      parse_articles
      parse_journals
      parse_authors

      data.each do |doi, record|
        issn = record.issn
        data[doi].journal = journals[issn]
      end
    end
  end
end
