require 'altmetric'
require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--format FORMAT') do |format|
    options[:formatter] = Altmetric::AVAILABLE_FORMATTERS.fetch(format.to_sym)
  end
end.parse!

journal_file = ARGV[0] || 'resources/journals.csv'
article_file = ARGV[1] || 'resources/articles.csv'
author_file  = ARGV[2] || 'resources/authors.json'

journal_data = CSV.read(journal_file)
journal_data.shift

article_data = CSV.read(article_file)
article_data.shift

author_data = JSON.parse(File.read(author_file))

parser_options = {
  journal_data: journal_data,
  article_data: article_data,
  author_data: author_data
}

parser = Altmetric::DataParser.new(parser_options)
parser.parse

puts options.fetch(:formatter).call(parser.data)
