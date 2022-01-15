require 'optparse'
require 'pathname'

class OptionsParser  
  OPTIONS = %i[month verbose path].freeze

  DEFAULT_PATH = ENV['PWD'] + '/agenda.pdf'
  
  def initialize
    @options = {}

    parse_options
  end

  def path
    @options[:path] || DEFAULT_PATH
  end

  def month
    @options[:month] || DateTime.now.month
  end

  def verbose
    @options[:verbose]
  end
  
  private

  def parse_options        
    OptionParser.new do |opts|
      opts.banner = "Usage: agenda_pdf [options]"

      opts.on("-m", "--month", "Generates a pdf for current month") do |v|
        @options[:month] = DateTime.parse(v) rescue DateTime.now.month
      end
      
      opts.on("-o", "--path", "The output file path") do |v|
        @options[:path] = Pathname.new(v)
      end
      
      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        @options[:verbose] = v || false
      end
    end.parse!
  end
end
