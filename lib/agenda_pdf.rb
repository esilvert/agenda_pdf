require 'date'

require "agenda_pdf/version"
require "agenda_pdf/options_parser"
require "agenda_pdf/pdf_generator"

module AgendaPdf
  class Error < StandardError; end

  def self.execute(argv)
    options = OptionsParser.new

    PdfGenerator.generate_month(options.month, path: options.path)
  end
end
