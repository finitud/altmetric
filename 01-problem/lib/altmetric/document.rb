module Altmetric
  class Document
    attr_accessor :title, :author, :journal, :issn

    def initialize
      @author ||= []
    end

    def to_json(*args)
      {title: title, author: author, journal: journal, issn: issn}.to_json(*args)
    end
  end
end
