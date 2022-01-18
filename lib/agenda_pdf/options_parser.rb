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
    @options[:month] || DateTime.now
  end

  def verbose
    @options[:verbose]
  end
  
  private

  def parse_options        
    OptionParser.new do |opts|
      opts.banner = "Usage: agenda_pdf [options]"

      opts.on("-mMONTH", "--month=MONTH", "Generates a pdf for given month (ex: 2021-02-01)") do |v|
        @options[:month] = DateTime.parse(v) rescue DateTime.now
      end
      
      opts.on("-oPATH", "--path=PATH", "The output file path") do |v|
        @options[:path] = Pathname.new(v)
      end
      
      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        @options[:verbose] = v || false
      end
    end.parse!
  end
end
