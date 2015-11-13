module Altmetric
  class Document
    attr_accessor :title, :authors, :journal, :issn

    def initialize
      @authors ||= []
    end
  end
end
